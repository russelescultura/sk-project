# Docker Setup Guide for SK Project

This guide will walk you through dockerizing your Next.js SK Project application step by step.

## 📋 Prerequisites

Before starting, make sure you have:
- Docker Desktop installed on your system
- Docker Compose (usually comes with Docker Desktop)
- Basic understanding of command line

## 🚀 Step-by-Step Docker Setup

### Step 1: Prepare Environment Variables

1. Copy the example environment file:
   ```bash
   cp env.example .env
   ```

2. Edit the `.env` file with your actual values:
   ```env
   # Database Configuration (for Docker, these will be overridden)
   DATABASE_URL="mysql://sk_user:sk_password@mysql:3306/sk_project"
   
   # Email Configuration (Gmail)
   GMAIL_USER="your-email@gmail.com"
   GMAIL_APP_PASSWORD="your-app-password"
   
   # SMTP Configuration
   SMTP_USER="your-email@gmail.com"
   SMTP_PASS="your-app-password"
   ```

### Step 2: Build and Run with Docker Compose

1. **Build the application:**
   ```bash
   docker-compose build
   ```

2. **Start all services:**
   ```bash
   docker-compose up -d
   ```

3. **Check if containers are running:**
   ```bash
   docker-compose ps
   ```

### Step 3: Initialize Database

1. **Run database migrations:**
   ```bash
   docker-compose exec app npx prisma migrate deploy
   ```

2. **Generate Prisma client:**
   ```bash
   docker-compose exec app npx prisma generate
   ```

3. **Seed the database (optional):**
   ```bash
   docker-compose exec app npm run db:seed
   ```

### Step 4: Access Your Application

- **Main Application:** http://localhost:3000
- **phpMyAdmin (Database Management):** http://localhost:8080
  - Username: `sk_user`
  - Password: `sk_password`

## 🛠️ Docker Commands Reference

### Basic Commands

```bash
# Start all services
docker-compose up -d

# Stop all services
docker-compose down

# View logs
docker-compose logs -f

# View logs for specific service
docker-compose logs -f app
docker-compose logs -f mysql

# Restart a specific service
docker-compose restart app

# Rebuild and start
docker-compose up --build -d
```

### Database Commands

```bash
# Access MySQL container
docker-compose exec mysql mysql -u sk_user -p sk_project

# Run Prisma commands
docker-compose exec app npx prisma studio
docker-compose exec app npx prisma migrate dev
docker-compose exec app npx prisma db push
```

### Development Commands

```bash
# Install new npm packages
docker-compose exec app npm install package-name

# Run tests
docker-compose exec app npm test

# Access app container shell
docker-compose exec app sh
```

## 🔧 Troubleshooting

### Common Issues

1. **Port already in use:**
   ```bash
   # Check what's using port 3000
   netstat -tulpn | grep :3000
   
   # Change ports in docker-compose.yml if needed
   ```

2. **Database connection issues:**
   ```bash
   # Check if MySQL is running
   docker-compose logs mysql
   
   # Restart MySQL
   docker-compose restart mysql
   ```

3. **Build failures:**
   ```bash
   # Clean build cache
   docker-compose build --no-cache
   
   # Remove all containers and rebuild
   docker-compose down
   docker-compose up --build -d
   ```

4. **Permission issues with uploads:**
   ```bash
   # Fix permissions for uploads directory
   sudo chown -R 1001:1001 public/uploads
   ```

### Reset Everything

If you need to start fresh:

```bash
# Stop and remove all containers, networks, and volumes
docker-compose down -v

# Remove all images
docker-compose down --rmi all

# Start fresh
docker-compose up --build -d
```

## 📁 File Structure

After dockerization, your project structure includes:

```
sk-project/
├── Dockerfile              # Docker configuration for the app
├── docker-compose.yml      # Multi-container setup
├── .dockerignore           # Files to ignore during build
├── env.example             # Environment variables template
├── DOCKER_SETUP.md         # This guide
└── src/app/api/health/     # Health check endpoint
```

## 🚀 Production Deployment

For production deployment:

1. **Update environment variables:**
   ```env
   NODE_ENV=production
   DATABASE_URL="mysql://sk_user:sk_password@mysql:3306/sk_project"
   ```

2. **Use production database:**
   - Consider using managed database services
   - Update connection strings accordingly

3. **Set up reverse proxy:**
   - Use Nginx or Traefik for SSL termination
   - Configure proper domain names

4. **Monitor and backup:**
   - Set up monitoring for containers
   - Regular database backups
   - Log management

## 🔒 Security Considerations

1. **Change default passwords** in production
2. **Use secrets management** for sensitive data
3. **Enable SSL/TLS** for production
4. **Regular security updates** for base images
5. **Network isolation** between services

## 📊 Monitoring

Monitor your application:

```bash
# Check container health
docker-compose ps

# Monitor resource usage
docker stats

# View application logs
docker-compose logs -f app
```

## 🆘 Getting Help

If you encounter issues:

1. Check the logs: `docker-compose logs -f`
2. Verify environment variables
3. Ensure all ports are available
4. Check Docker Desktop is running
5. Verify database connectivity

## 🎉 Success!

Once everything is running, you should see:
- ✅ Application accessible at http://localhost:3000
- ✅ Database accessible via phpMyAdmin at http://localhost:8080
- ✅ All containers running without errors
- ✅ Health check endpoint responding at http://localhost:3000/api/health

Your SK Project is now successfully dockerized! 🐳
