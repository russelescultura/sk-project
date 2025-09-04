# SK Project - Youth Council Management System 🐳


A modern, full-stack web application built with Next.js, TypeScript, and Tailwind CSS for managing youth council programs, events, and community engagement.

**✨ Now fully Dockerized for easy deployment and development!**

## 🚀 Features

- **User Management**: Secure authentication and role-based access control
- **Program Management**: Create, edit, and manage youth programs
- **Event Calendar**: Interactive calendar for scheduling and managing events
- **Content Management**: Dynamic content creation and management
- **Map Integration**: Interactive maps for location-based services
- **Budget Tracking**: Expense and revenue management
- **Form Builder**: Dynamic form creation with QR code generation
- **Analytics Dashboard**: Comprehensive reporting and analytics
- **Responsive Design**: Mobile-first approach with Tailwind CSS

## 🎯 Problems This Project Solves

### **Youth Council Management Challenges**
- **Manual Process Inefficiency**: Replaces paper-based forms and manual record-keeping with digital automation
- **Communication Gaps**: Bridges communication between youth council members, local government, and community
- **Data Fragmentation**: Centralizes all youth programs, events, and member information in one system
- **Limited Accessibility**: Provides 24/7 access to youth council services and information
- **Resource Tracking**: Eliminates manual budget and resource tracking difficulties

### **Community Engagement Issues**
- **Low Participation**: Increases youth engagement through digital platforms and mobile accessibility
- **Information Dissemination**: Streamlines announcement distribution and event promotion
- **Registration Barriers**: Simplifies program registration and form submission processes
- **Geographic Limitations**: Connects youth across different barangay locations through digital means

### **Administrative Overhead**
- **Manual Reporting**: Automates report generation and analytics for better decision-making
- **Document Management**: Organizes and secures important documents and records
- **Compliance Tracking**: Ensures proper documentation for government compliance requirements
- **Resource Allocation**: Optimizes budget and resource distribution through data-driven insights

## 🛠️ Technologies Used

### **Frontend Technologies**
- **Next.js 14**: React framework with App Router for optimal performance and SEO
- **React 18**: Modern React with concurrent features and improved rendering
- **TypeScript**: Type-safe JavaScript development for better code quality
- **Tailwind CSS**: Utility-first CSS framework for rapid UI development
- **Radix UI**: Accessible, unstyled UI components for consistent design
- **Lucide Icons**: Beautiful, customizable icon library

### **Backend & Database**
- **Next.js API Routes**: Serverless API endpoints for backend functionality
- **Prisma ORM**: Type-safe database client with automatic migrations
- **MySQL**: Relational database (not PostgreSQL as previously stated)
- **Custom Auth Context**: React Context-based authentication (not NextAuth.js)
- **Nodemailer**: Email service integration

### **Development Tools**
- **ESLint & Prettier**: Code quality and formatting standards
- **Jest & Testing Library**: Comprehensive testing framework
- **Git & GitHub**: Version control and collaboration
- **Husky & lint-staged**: Git hooks for code quality
- **TSX**: TypeScript execution environment

### **Third-Party Integrations**
- **Leaflet & React-Leaflet**: Interactive maps and location services
- **FullCalendar**: Calendar and event management functionality
- **Recharts**: Data visualization and charting
- **Swiper**: Touch slider and carousel functionality
- **QR Code Generation**: Dynamic QR code creation for forms
- **File Upload Services**: Secure file storage and management

### **UI & Animation**
- **Tailwind CSS Animate**: CSS animation utilities
- **Class Variance Authority**: Component variant management
- **CLSX & Tailwind Merge**: Conditional class name utilities

## 🚧 Challenges Overcome

### **Technical Challenges**
- **Complex State Management**: Implemented efficient state management patterns for multi-user, multi-role system
- **Real-time Data Synchronization**: Solved issues with concurrent data updates and form submissions
- **File Upload Complexity**: Built robust file handling system supporting multiple file types and sizes
- **Database Schema Evolution**: Managed complex database relationships while maintaining data integrity
- **Performance Optimization**: Optimized large dataset handling and image processing for better user experience

### **User Experience Challenges**
- **Mobile-First Design**: Ensured seamless experience across all device sizes and screen resolutions
- **Accessibility Compliance**: Implemented WCAG guidelines for inclusive user experience
- **Multi-language Support**: Designed system architecture to support future localization needs
- **Offline Capabilities**: Built progressive web app features for limited connectivity scenarios

### **Security & Compliance**
- **Role-Based Access Control**: Implemented complex permission system for different user types
- **Data Privacy**: Ensured compliance with local government data protection requirements
- **Audit Trail**: Built comprehensive logging system for accountability and transparency
- **Input Validation**: Implemented robust validation to prevent security vulnerabilities

### **Integration Challenges**
- **Government System Compatibility**: Ensured system works with existing government infrastructure
- **Third-Party API Integration**: Successfully integrated multiple external services (maps, email, file storage)
- **Legacy Data Migration**: Handled migration from existing paper-based systems to digital platform
- **Multi-stakeholder Coordination**: Coordinated development with various government departments and youth groups

### **Deployment & Infrastructure**
- **Environment Configuration**: Managed complex environment setups for development, staging, and production
- **Database Migration Strategy**: Implemented safe database schema evolution without data loss
- **Performance Monitoring**: Set up comprehensive monitoring and error tracking systems
- **Scalability Planning**: Designed architecture to handle growing user base and data volume

## 📋 Prerequisites

- Node.js 18.17.0 or higher
- npm 9.0.0 or higher
- MySQL 8.0 or higher
- Git

## 🚀 Quick Start

### Option 1: 🐳 Docker Setup (Recommended)

The easiest way to run this project is using Docker:

```bash
# 1. Clone the repository
git clone https://github.com/your-username/sk-project.git
cd sk-project

# 2. Set up environment variables
cp env.example .env

# 3. Start with Docker
docker-compose up -d

# 4. Access the application
# Main App: http://localhost:3001
# Database Admin: http://localhost:8080
```

**That's it! 🎉** Your application is now running with:
- ✅ Next.js application on port 3001
- ✅ MySQL database on port 3307
- ✅ phpMyAdmin on port 8080
- ✅ All dependencies automatically installed
- ✅ Database schema automatically set up

### Option 2: 💻 Local Development Setup

If you prefer to run without Docker:

```bash
# 1. Clone the repository
git clone https://github.com/your-username/sk-project.git
cd sk-project

# 2. Install dependencies
npm install

# 3. Set up environment variables
cp env.example .env.local
# Edit .env.local with your local database configuration

# 4. Set up the database
npx prisma migrate dev
npx prisma db seed

# 5. Start the development server
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## 📁 Project Structure

```
sk-project/
├── src/
│   ├── app/                 # Next.js App Router pages
│   ├── components/          # Reusable React components
│   ├── lib/                 # Utility functions and configurations
│   └── types/               # TypeScript type definitions
├── prisma/                  # Database schema and migrations
├── public/                  # Static assets
├── tests/                   # Test files
└── docs/                    # Documentation
```

## 🧪 Testing

```bash
# Run all tests
npm test

# Run tests in watch mode
npm run test:watch

# Run tests with coverage
npm run test:coverage

# Run E2E tests
npm run test:e2e
```

## 📦 Build & Deployment

### Development

```bash
npm run dev
```

### Production Build

```bash
npm run build
npm start
```

### Docker Deployment

```bash
# Build Docker image
docker build -t sk-project .

# Run container
docker run -p 3000:3000 sk-project
```

## 🔧 Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run start` - Start production server
- `