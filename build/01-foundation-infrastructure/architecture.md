# Foundation Infrastructure Architecture

## Purpose

The Foundation Infrastructure layer provides the secure AWS network base for the Apex Operational Systems modernisation programme. It establishes the VPC, public and private subnet structure, internet access, controlled outbound routing, and baseline security groups required for later application, data, observability and AI operations components.

## Architecture Overview

The foundation platform was deployed into AWS using Terraform and includes:

- One VPC using CIDR range `10.0.0.0/16`
- Two public subnets across two Availability Zones
- Two private subnets across two Availability Zones
- One Internet Gateway for public internet connectivity
- One NAT Gateway for controlled outbound access from private subnets
- Separate public and private route tables
- Security groups for application, database and load balancer access

## High-Level Flow

External users or systems enter through the public layer.

Traffic reaches the public subnets where internet-facing components such as the Application Load Balancer will be placed.

Application workloads will run in private subnets and will not be directly exposed to the internet.

Private resources use the NAT Gateway for outbound access where required, such as software updates, package downloads or external API calls.

Database and messaging resources will remain private and will only be reachable from approved application security groups.

## Implemented Components

| Component | Implementation |
|---|---|
| AWS Region | `eu-west-2` |
| VPC | `10.0.0.0/16` |
| Public Subnets | 2 |
| Private Subnets | 2 |
| Internet Gateway | 1 |
| NAT Gateway | 1 |
| Route Tables | Public and private route tables |
| Security Groups | ALB, application and database security groups |
| Deployment Method | Terraform |
| Validation Evidence | Terraform output and AWS console screenshots |

## Architecture Decisions

### VPC CIDR: `10.0.0.0/16`

A `/16` CIDR range was selected to provide enough address space for future application, data, observability and AI operations layers. This avoids early IP exhaustion and supports future subnet expansion.

### Multi-AZ Subnet Design

Public and private subnets were deployed across two Availability Zones to support resilience and availability. This prepares the platform for highly available workloads such as ECS Fargate services, load balancing and Multi-AZ database services.

### Public and Private Segmentation

Public subnets are reserved for internet-facing components such as the Application Load Balancer and NAT Gateway. Application services, databases and internal services are placed in private subnets to reduce public exposure.

### NAT Gateway

A NAT Gateway was included to allow private subnet resources to make outbound internet requests without accepting inbound internet traffic. This supports secure patching, dependency downloads and external service communication.

### Security Groups

Baseline security groups were created for the load balancer, application layer and database layer. This prepares the foundation for least-privilege traffic rules as the platform evolves.

## Deployment Evidence

Terraform successfully deployed the foundation infrastructure.

Terraform output confirmed creation of:

- VPC ID
- Public subnet IDs
- Private subnet IDs
- Internet Gateway ID
- NAT Gateway ID
- Security group IDs

## Relationship to Target Architecture

This foundation supports the wider AWS target architecture by providing the base network and security structure required for:

- Application Load Balancer
- ECS Fargate services
- RDS SQL Server
- Amazon MQ
- Observability services
- AI-assisted operations components

## Next Steps

The next implementation phase will build on this foundation by deploying the Application Platform layer, including load balancing, ECS Fargate service structure, container registry and deployment strategy.
