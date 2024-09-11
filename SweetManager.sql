CREATE TABLE admins
(
    id int NOT NULL,
    roles_id int NOT NULL,
    username varchar(50) NOT NULL,
    name varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    phone int NOT NULL,
    email varchar(100) NOT NULL,
    state varchar(20) NOT NULL,
    
    CONSTRAINT pk_admin_id PRIMARY KEY (id)
);

-- Table: admins_credentials
CREATE TABLE admins_credentials
(
    admins_id int NOT NULL,
    code varchar(50) NOT NULL,
    
    CONSTRAINT pk_admin_credential_admins_id PRIMARY KEY (admins_id)
);

-- Table: assignments_workers
CREATE TABLE assignments_workers
(
    id int NOT NULL AUTO_INCREMENT,
    workers_areas_id int NOT NULL,
    workers_id int NOT NULL,
    admins_id int NOT NULL,
    start_date datetime NOT NULL,
    final_date datetime NOT NULL,
    state varchar(20) NOT NULL,
    
    CONSTRAINT pk_assignment_worker_id PRIMARY KEY (id)
);

-- Table: bookings
CREATE TABLE bookings
(
    id int NOT NULL AUTO_INCREMENT,
    payments_customers_id int NOT NULL,
    rooms_id int NOT NULL,
    description varchar(100) NOT NULL,
    start_date datetime NOT NULL,
    final_date datetime NOT NULL,
    price_room decimal(10,2) NOT NULL,
    night_count int NOT NULL,
    amount decimal(10,2) NOT NULL,
    state varchar(20) NOT NULL,
    
    CONSTRAINT pk_booking_id PRIMARY KEY (id)
);

-- Table: contracts_owners
CREATE TABLE contracts_owners
(
    id int NOT NULL AUTO_INCREMENT,
    subscriptions_id int NOT NULL,
    owners_id int NOT NULL,
    start_date datetime NOT NULL,
    final_date datetime NOT NULL,
    state varchar(20) NOT NULL,
    
    CONSTRAINT pk_contract_owner_id PRIMARY KEY (id)
);

-- Table: customers
CREATE TABLE customers
(
    id int NOT NULL,
    username varchar(50) NOT NULL,
    name varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    phone int NOT NULL,
    state varchar(20) NOT NULL,
    
    CONSTRAINT pk_customer_id PRIMARY KEY (id)
);

-- Table: hotels
CREATE TABLE hotels
(
    id int NOT NULL AUTO_INCREMENT,
    owners_id int NOT NULL,
    name varchar(50) NOT NULL,
    description varchar(100) NOT NULL,
    address varchar(50) NOT NULL,
    phone int NOT NULL,
    email varchar(100) NOT NULL,
    
    CONSTRAINT pk_hotel_id PRIMARY KEY (id)
);

-- Table: notifications
CREATE TABLE notifications
(
    id int NOT NULL AUTO_INCREMENT,
    types_notifications_id int NOT NULL,
    owners_id int NULL,
    admins_id int NULL,
    workers_id int NULL,
    title varchar(50) NOT NULL,
    description varchar(200) NOT NULL,
    
    CONSTRAINT pk_notification_id PRIMARY KEY (id)
);

-- Table: owners
CREATE TABLE owners
(
    id int NOT NULL,
    username varchar(50) NOT NULL,
    name varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    phone int NOT NULL,
    email varchar(100) NOT NULL,
    state varchar(20) NOT NULL,
    
    CONSTRAINT pk_owner_id PRIMARY KEY (id)
);

-- Table: owners_credentials
CREATE TABLE owners_credentials
(
    owners_id int NOT NULL,
    code varchar(50) NOT NULL,
    
    CONSTRAINT pk_owner_credential_owners_id PRIMARY KEY (owners_id)
);

-- Table: payments_customers
CREATE TABLE payments_customers
(
    id int NOT NULL AUTO_INCREMENT,
    customers_id int NOT NULL,
    final_amount decimal(10,2) NOT NULL,
    
    CONSTRAINT pk_payment_customer_id PRIMARY KEY (id)
);

-- Table: payments_owners
CREATE TABLE payments_owners
(
    id int NOT NULL AUTO_INCREMENT,
    owners_id int NOT NULL,
    description varchar(200) NOT NULL,
    final_amount decimal(10,2) NOT NULL,
    
    CONSTRAINT pk_payment_owner_id PRIMARY KEY (id)
);

-- Table: providers
CREATE TABLE providers
(
    id int NOT NULL,
    name varchar(50) NOT NULL,
    address varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    phone int NOT NULL,
    state varchar(20) NOT NULL,
    
    CONSTRAINT pk_provider_id PRIMARY KEY (id)
);

-- Table: reports
CREATE TABLE reports
(
    id int NOT NULL AUTO_INCREMENT,
    types_reports_id int NOT NULL,
    admins_id int NOT NULL,
    workers_id int NOT NULL,
    file_url varchar(6000) NOT NULL,
    title varchar(50) NOT NULL,
    description varchar(200) NOT NULL,
    
    CONSTRAINT pk_report_id PRIMARY KEY (id)
);

-- Table: roles
CREATE TABLE roles
(
    id int NOT NULL AUTO_INCREMENT,
    owners_id int NOT NULL,
    name varchar(50) NOT NULL,
    
    CONSTRAINT pk_role_id PRIMARY KEY (id)
);

-- Table: rooms
CREATE TABLE rooms
(
    id int NOT NULL AUTO_INCREMENT,
    types_rooms_id int NOT NULL,
    hotels_id int NOT NULL,
    state varchar(20) NOT NULL,
    
    CONSTRAINT pk_room_id PRIMARY KEY (id)
);

-- Table: subscriptions
CREATE TABLE subscriptions
(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    description varchar(200) NOT NULL,
    price decimal(10,2) NOT NULL,
    state varchar(20) NOT NULL,
    
    CONSTRAINT pk_subscription_id PRIMARY KEY (id)
);

-- Table: supplies
CREATE TABLE supplies
(
    id int NOT NULL AUTO_INCREMENT,
    providers_id int NOT NULL,
    name varchar(50) NOT NULL,
    price decimal(10,2) NOT NULL,
    stock int NOT NULL,
    state varchar(20) NOT NULL,
    
    CONSTRAINT pk_supply_id PRIMARY KEY (id)
);

-- Table: supplies_requests
CREATE TABLE supplies_requests
(
    id int NOT NULL AUTO_INCREMENT,
    payments_owners_id int NOT NULL,
    supplies_id int NOT NULL,
    count int NOT NULL,
    amount decimal(10,2) NOT NULL,
    
    CONSTRAINT pk_supply_request_id PRIMARY KEY (id)
);

-- Table: types_notifications
CREATE TABLE types_notifications
(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    
    CONSTRAINT pk_type_notification_id PRIMARY KEY (id)
);

-- Table: types_reports
CREATE TABLE types_reports
(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    
    CONSTRAINT pk_type_report_id PRIMARY KEY (id)
);

-- Table: types_rooms
CREATE TABLE types_rooms
(
    id int NOT NULL AUTO_INCREMENT,
    description varchar(200) NOT NULL,
    price decimal(10,2) NOT NULL,
    
    CONSTRAINT pk_type_room_id PRIMARY KEY (id)
);

-- Table: workers
CREATE TABLE workers
(
    id int NOT NULL,
    roles_id int NOT NULL,
    username varchar(50) NOT NULL,
    name varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    phone int NOT NULL,
    email varchar(100) NOT NULL,
    state varchar(20) NOT NULL,
    
    CONSTRAINT pk_worker_id PRIMARY KEY (id)
);

-- Table: workers_areas
CREATE TABLE workers_areas
(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    
    CONSTRAINT pk_worker_area_id PRIMARY KEY (id)
);

-- Table: workers_credentials
CREATE TABLE workers_credentials
(
    workers_id int  NOT NULL,
    code varchar(50)  NOT NULL,
    
    CONSTRAINT pk_worker_credential_workers_id PRIMARY KEY (workers_id)
);

-- foreign keys
-- Reference: Table_30_payments_owners (table: supplies_requests)
ALTER TABLE supplies_requests ADD CONSTRAINT fk_supplies_requests_payments_owners_id FOREIGN KEY (payments_owners_id)
    REFERENCES payments_owners (id);

-- Reference: Table_30_supplies (table: supplies_requests)
ALTER TABLE supplies_requests ADD CONSTRAINT fk_supplies_requests_supplies_id FOREIGN KEY (supplies_id)
    REFERENCES supplies (id);

-- Reference: admins_credentials_admins (table: admins_credentials)
ALTER TABLE admins_credentials ADD CONSTRAINT fk_admins_credentials_admins_id FOREIGN KEY (admins_id)
    REFERENCES admins (id);

-- Reference: admins_roles (table: admins)
ALTER TABLE admins ADD CONSTRAINT fk_admins_roles_id FOREIGN KEY admins_roles (roles_id)
    REFERENCES roles (id);

-- Reference: assignments_workers_admins (table: assignments_workers)
ALTER TABLE assignments_workers ADD CONSTRAINT fk_assignments_workers_admins_id FOREIGN KEY (admins_id)
    REFERENCES admins (id);

-- Reference: assignments_workers_workers (table: assignments_workers)
ALTER TABLE assignments_workers ADD CONSTRAINT fk_assignments_workers_workers_id FOREIGN KEY (workers_id)
    REFERENCES workers (id);

-- Reference: assignments_workers_workers_areas (table: assignments_workers)
ALTER TABLE assignments_workers ADD CONSTRAINT fk_assignments_workers_workers_areas_id FOREIGN KEY (workers_areas_id)
    REFERENCES workers_areas (id);

-- Reference: bookings_payments_customers (table: bookings)
ALTER TABLE bookings ADD CONSTRAINT fk_bookings_payments_customers_id FOREIGN KEY (payments_customers_id)
    REFERENCES payments_customers (id);

-- Reference: bookings_rooms (table: bookings)
ALTER TABLE bookings ADD CONSTRAINT fk_bookings_rooms_id FOREIGN KEY (rooms_id)
    REFERENCES rooms (id);

-- Reference: contracts_subscriptions_owners (table: contracts_owners)
ALTER TABLE contracts_owners ADD CONSTRAINT fk_contracts_owners_owners_id FOREIGN KEY (owners_id)
    REFERENCES owners (id);

-- Reference: contracts_subscriptions_subscriptions (table: contracts_owners)
ALTER TABLE contracts_owners ADD CONSTRAINT fk_contracts_owners_subscriptions_id FOREIGN KEY (subscriptions_id)
    REFERENCES subscriptions (id);

-- Reference: hotels_owners (table: hotels)
ALTER TABLE hotels ADD CONSTRAINT fk_hotels_owners_id FOREIGN KEY (owners_id)
    REFERENCES owners (id);

-- Reference: notifications_admins (table: notifications)
ALTER TABLE notifications ADD CONSTRAINT fk_notifications_admins_id FOREIGN KEY (admins_id)
    REFERENCES admins (id);

-- Reference: notifications_owners (table: notifications)
ALTER TABLE notifications ADD CONSTRAINT fk_notifications_owners_id FOREIGN KEY (owners_id)
    REFERENCES owners (id);

-- Reference: notifications_types_notifications (table: notifications)
ALTER TABLE notifications ADD CONSTRAINT fk_notifications_types_notifications_id FOREIGN KEY (types_notifications_id)
    REFERENCES types_notifications (id);

-- Reference: notifications_workers (table: notifications)
ALTER TABLE notifications ADD CONSTRAINT fk_notifications_workers_id FOREIGN KEY (workers_id)
    REFERENCES workers (id);

-- Reference: owners_credentials_owners (table: owners_credentials)
ALTER TABLE owners_credentials ADD CONSTRAINT fk_owners_credentials_owners_id FOREIGN KEY (owners_id)
    REFERENCES owners (id);

-- Reference: payments_customers_customers (table: payments_customers)
ALTER TABLE payments_customers ADD CONSTRAINT fk_payments_customers_customers_id FOREIGN KEY (customers_id)
    REFERENCES customers (id);

-- Reference: payments_owners (table: payments_owners)
ALTER TABLE payments_owners ADD CONSTRAINT fk_payments_owners_owners_id FOREIGN KEY (owners_id)
    REFERENCES owners (id);

-- Reference: reports_admins (table: reports)
ALTER TABLE reports ADD CONSTRAINT fk_reports_admins_id FOREIGN KEY (admins_id)
    REFERENCES admins (id);

-- Reference: reports_types_reports (table: reports)
ALTER TABLE reports ADD CONSTRAINT fk_reports_types_reports_id FOREIGN KEY (types_reports_id)
    REFERENCES types_reports (id);

-- Reference: reports_workers (table: reports)
ALTER TABLE reports ADD CONSTRAINT fk_reports_workers_id FOREIGN KEY (workers_id)
    REFERENCES workers (id);

-- Reference: roles_owners (table: roles)
ALTER TABLE roles ADD CONSTRAINT fk_roles_owners_id FOREIGN KEY (owners_id)
    REFERENCES owners (id);

-- Reference: rooms_hotels (table: rooms)
ALTER TABLE rooms ADD CONSTRAINT fk_rooms_hotels_id FOREIGN KEY (hotels_id)
    REFERENCES hotels (id);

-- Reference: rooms_types_rooms (table: rooms)
ALTER TABLE rooms ADD CONSTRAINT fk_rooms_types_rooms_id FOREIGN KEY (types_rooms_id)
    REFERENCES types_rooms (id);

-- Reference: supplies_providers (table: supplies)
ALTER TABLE supplies ADD CONSTRAINT fk_supplies_providers_id FOREIGN KEY (providers_id)
    REFERENCES providers (id);

-- Reference: workers_credentials_workers (table: workers_credentials)
ALTER TABLE workers_credentials ADD CONSTRAINT fk_workers_credentials_workers_id FOREIGN KEY (workers_id)
    REFERENCES workers (id);

-- Reference: workers_roles (table: workers)
ALTER TABLE workers ADD CONSTRAINT fk_workers_roles_id FOREIGN KEY (roles_id)
    REFERENCES roles (id);

-- End of file.