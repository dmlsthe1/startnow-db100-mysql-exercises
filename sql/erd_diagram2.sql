CREATE TABLE `Role` (
  `id` integer,
  `role_type` varchar(50),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Hospital` (
  `id` integer,
  `name` varchar(50),
  `phone_number` varchar(20),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Room_type` (
  `id` integer,
  `name` varchar(50),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Employee` (
  `id` integer,
  `first_name` varchar(50),
  `last_name` varchar(50),
  `phone_number` varchar(20),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Patient` (
  `id` integer,
  `first_name` varchar(50),
  `last_name` varchar(50),
  `phone_number` varchar(20),
  `blood_type` varchar(20),
  `weigtht` varchar(20),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Disease` (
  `id` integer,
  `name` varchar(50),
  `treatable` varchar(20),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Room` (
  `id` integer,
  `room_id` integer,
  `hospital_id` integer,
  PRIMARY KEY (`id`),
  KEY `FK` (`room_id`, `hospital_id`)
);

CREATE TABLE `Treatment` (
  `id` integer,
  `name` varchar(50),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Diagnosis` (
  `id` integer,
  `patient_id` integer,
  `disease_id` integer,
  `employee_id` integer,
  PRIMARY KEY (`id`),
  KEY `FK` (`patient_id`, `disease_id`, `employee_id`)
);

CREATE TABLE `Appointment` (
  `id` integer,
  `employee_id` integer,
  `patient_id` integer,
  PRIMARY KEY (`id`),
  KEY `FK` (`employee_id`, `patient_id`)
);

CREATE TABLE `Patien/Room` (
  `id` integer,
  `room_id` integer,
  `patient_id` integer,
  PRIMARY KEY (`id`),
  KEY `FK` (`room_id`, `patient_id`)
);

CREATE TABLE `Diagnosis/Disease` (
  `id` integer,
  `diagnosis_id` integer,
  `disease_id` integer,
  PRIMARY KEY (`id`),
  KEY `FK` (`diagnosis_id`, `disease_id`)
);

CREATE TABLE `Disease/Treatment` (
  `id` integer,
  `disease_id` integer,
  `treatment_id` integer,
  PRIMARY KEY (`id`),
  KEY `FK` (`disease_id`, `treatment_id`)
);

CREATE TABLE `Employee/Role` (
  `id` integer,
  `role_id` integer,
  `employee_id` integer,
  PRIMARY KEY (`id`),
  KEY `FK` (`role_id`, `employee_id`)
);

