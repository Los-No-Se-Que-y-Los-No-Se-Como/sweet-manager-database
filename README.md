# SweetManager Database

## Summary
Sweet Manager Database Diagram, made with Vertabelo for MySQL Database. It illustrates how SweetManager's information will be saved between tables. 

## Bounded Contexts
SweetManager's database is divided in the following bounded contexts:
- Service Operation & Monitoring 
- Supply Management
- Communication
- Identity Access Management (IAM)
- Profiles Management
- Commerce 
- Resource Management

### Service Operation & Monitoring Context
The Monitoring Context is responsible for managing the rooms of the hotel. It includes the following tables:
- bookings
- rooms
- type_rooms

### Supply Management Context
The Supplies Context is responsible for managing the supplies of the hotel. It includes the following tables:
- supplies
- supplies_request

### Communication Context
The Communication Context is responsible for managing the messages of the users. It includes the following tables:
- notification
- type_notifications

### Identity Access Management Context (IAM)
The IAM Context is responsible for managing the authentications of the hotel. It includes the following tables:
- admin
- worker
- owner
- assigment_workers
- admin_credentials
- owner_credentials
- worker_credentials
- role
- worker_areas

### Profiles Management Context
The Profiles Management Context is responsible for managing the secondaries profiles of the hotel as Customers and Providers. It includes the following tables:
- customers
- providers
- hotels

### Resource Management Context
The Resource Management Context is responsible for managing the reports of the hotel. It includes the following tables:
- reports
- type_reports

### Commerce Context
The Commerce Context is responsible for managing the payments and subscription of the hotel. It includes the following tables:
- subscriptions
- contract_owners
- payment_customers
- payment_owners



