# AWS ECS Deployment Guide for SK Project

This guide will help you deploy your dockerized SK Project to Amazon ECS (Elastic Container Service).

## 🚀 Quick Deploy to AWS

### Prerequisites

1. **AWS Account** with appropriate permissions
2. **AWS CLI** installed and configured
3. **Docker** working locally
4. **GitHub repository** with your code

### Step 1: Create AWS Resources

```bash
# 1. Create ECR Repository
aws ecr create-repository --repository-name sk-project --region us-east-1

# 2. Create ECS Cluster
aws ecs create-cluster --cluster-name sk-project-cluster --region us-east-1

# 3. Create RDS MySQL Database (Optional - for production)
aws rds create-db-instance \
    --db-instance-identifier sk-project-db \
    --db-instance-class db.t3.micro \
    --engine mysql \
    --master-username sk_admin \
    --master-user-password YOUR_SECURE_PASSWORD \
    --allocated-storage 20 \
    --db-name sk_project \
    --region us-east-1
```

### Step 2: Configure Secrets Manager

Store sensitive data securely:

```bash
# Database password
aws secretsmanager create-secret \
    --name "sk-project/db-password" \
    --description "Database password for SK Project" \
    --secret-string "YOUR_DB_PASSWORD" \
    --region us-east-1

# Gmail credentials
aws secretsmanager create-secret \
    --name "sk-project/gmail-user" \
    --secret-string "your-email@gmail.com" \
    --region us-east-1

aws secretsmanager create-secret \
    --name "sk-project/gmail-password" \
    --secret-string "your-app-password" \
    --region us-east-1
```

### Step 3: Update Configuration Files

1. **Update `.aws/task-definition.json`:**
   - Replace `YOUR_ACCOUNT_ID` with your AWS account ID
   - Replace `YOUR_RDS_ENDPOINT` with your RDS endpoint
   - Update ARNs for your account

2. **Update `.github/workflows/deploy-aws-ecs.yml`:**
   - Set your preferred AWS region
   - Update repository names if needed

### Step 4: Create IAM Roles

```bash
# Create ECS Task Execution Role
aws iam create-role --role-name ecsTaskExecutionRole --assume-role-policy-document file://ecs-trust-policy.json
aws iam attach-role-policy --role-name ecsTaskExecutionRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy

# Create ECS Task Role
aws iam create-role --role-name ecsTaskRole --assume-role-policy-document file://ecs-trust-policy.json
```

### Step 5: Set up GitHub Secrets

In your GitHub repository, go to Settings > Secrets and variables > Actions:

- `AWS_ACCESS_KEY_ID`: Your AWS access key
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret key

### Step 6: Create ECS Service

```bash
# Register task definition
aws ecs register-task-definition --cli-input-json file://.aws/task-definition.json

# Create service
aws ecs create-service \
    --cluster sk-project-cluster \
    --service-name sk-project-service \
    --task-definition sk-project-task \
    --desired-count 1 \
    --launch-type FARGATE \
    --network-configuration "awsvpcConfiguration={subnets=[subnet-12345],securityGroups=[sg-12345],assignPublicIp=ENABLED}"
```

## 🔧 Local Testing Before Deployment

Test your Docker setup locally:

```bash
# Build the production image
docker build -t sk-project .

# Test with production environment
docker run -p 3000:3000 \
  -e NODE_ENV=production \
  -e DB_HOST=your-db-host \
  -e DB_USER=sk_user \
  -e DB_PASSWORD=your-password \
  sk-project
```

## 🚀 Deployment Process

Once everything is configured:

1. **Push to GitHub main branch**
2. **GitHub Actions will automatically:**
   - Build your Docker image
   - Push to Amazon ECR
   - Deploy to ECS
   - Update the running service

## 📊 Monitoring and Logs

- **CloudWatch Logs**: View application logs
- **ECS Console**: Monitor service health
- **Application Load Balancer**: For production traffic

## 💰 Cost Estimation

**Monthly costs (approximate):**
- ECS Fargate (1 task): ~$15
- RDS db.t3.micro: ~$15
- ALB (if used): ~$25
- **Total**: ~$55/month

## 🔒 Security Best Practices

1. **Use Secrets Manager** for all sensitive data
2. **Enable VPC** for network isolation
3. **Use IAM roles** with minimal permissions
4. **Enable CloudTrail** for audit logging
5. **Regular security updates** of base images

## 🆘 Troubleshooting

**Common issues:**

1. **Task won't start**: Check CloudWatch logs
2. **Database connection**: Verify security groups
3. **Image pull errors**: Check ECR permissions
4. **Out of memory**: Increase task memory allocation

## 📞 Support

- AWS ECS Documentation
- GitHub Actions Documentation
- Docker Best Practices

Your SK Project will be production-ready on AWS! 🚀
