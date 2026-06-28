# 01 - Foundation Infrastructure

## Overview

This sprint establishes the AWS networking and infrastructure foundation for the Apex Operational Systems enterprise modernisation programme.

The objective is to create a secure, scalable and reusable landing zone that supports all future application, data and AI workloads.

---

## Business Objective

Provide a resilient AWS foundation capable of supporting cloud-native applications while following networking and security best practices.

---

## Services Implemented

- Amazon VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- Route Tables
- Route Table Associations
- Security Groups
- Terraform Remote Infrastructure Definition

---

## Architecture

The networking design separates public-facing resources from internal workloads using dedicated public and private subnets across multiple Availability Zones.

Architecture diagram:

```
architecture/foundation-infrastructure.drawio
```

---

## Terraform

Terraform is used to provision all infrastructure.

Location

```
terraform/
```

---

## Validation

Validation completed using

- terraform validate
- terraform fmt
- terraform plan
- terraform apply

Resources verified within the AWS Console.

---

## Evidence

Implementation screenshots can be found in

```
screenshots/
```

---

## Lessons Learned

- Terraform simplifies repeatable infrastructure deployments.
- Separating public and private networking improves security.
- Using consistent tagging improves governance and future automation.

---

## Next Sprint

02 – Application Platform

Deploy containerised workloads using Amazon ECS Fargate and an Application Load Balancer.
