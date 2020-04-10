--**********************************************************************************************--
-- Title: Final Project - Milestone 04
-- Author: Thomas Luk
-- Date: 2019-03-07
-- Desc: Insert sample data into the PatientAppointments Database
--***********************************************************************************************--

Use PatientAppointmentsDB_ThomasLuk;
GO

insert into Clinics (ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, ClinicState, ClinicZipCode) values ('Romaguera-Swaniawski', '405-749-9939', '01 Gerald Crossing', 'Oklahoma City', 'OK', '73114');
insert into Clinics (ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, ClinicState, ClinicZipCode) values ('Stehr-Reilly', '415-436-6537', '93225 Eliot Plaza', 'San Francisco', 'CA', '94147');
insert into Clinics (ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, ClinicState, ClinicZipCode) values ('Quigley LLC', '512-777-8896', '22002 Carioca Alley', 'Austin', 'TX', '78759');
insert into Clinics (ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, ClinicState, ClinicZipCode) values ('Cummerata LLC', '410-642-8670', '0271 Jenna Court', 'Baltimore', 'MD', '21290');
insert into Clinics (ClinicName, ClinicPhoneNumber, ClinicAddress, ClinicCity, ClinicState, ClinicZipCode) values ('Hartmann, Larkin and Cummerata', '757-774-1953', '633 Talisman Plaza', 'Portsmouth', 'VA', '23705');


insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Jodi', 'Phippen', '936-201-0351', '451 Clyde Gallagher Way', 'Beaumont', 'TX', '77705');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Veronica', 'Eriksson', '502-137-8875', '55533 Muir Circle', 'Louisville', 'KY', '40293');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Nicholas', 'Blazdell', '719-208-5062', '324 Springs Parkway', 'Colorado Springs', 'CO', '80905');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Callida', 'Saunper', '432-239-2069', '42101 Gateway Street', 'Odessa', 'TX', '79764');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Ferd', 'Lipp', '614-941-7005', '8 8th Court', 'Columbus', 'OH', '43204');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Britni', 'Orneblow', '915-276-8821', '28 Sugar Alley', 'El Paso', 'TX', '88584');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Serene', 'Rosevear', '724-416-6506', '5988 Esker Drive', 'Pittsburgh', 'PA', '15210');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Obadiah', 'Clifft', '850-233-5454', '9 Center Crossing', 'Pensacola', 'FL', '32511');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Marlowe', 'Cantopher', '602-488-2188', '48186 Shasta Crossing', 'Phoenix', 'AZ', '85072');
insert into Doctors (DoctorFirstName, DoctorLastName, DoctorPhoneNumber, DoctorAddress, DoctorCity, DoctorState, DoctorZipCode) values ('Manolo', 'Buckie', '612-664-1001', '4 Sutherland Crossing', 'Minneapolis', 'MN', '55407');
GO

insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Kirbie', 'O''Hearn', '952-843-5573', '26994 Hanson Pass', 'Young America', 'MN', '55564');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Felecia', 'Fydoe', '212-501-1133', '24 Dryden Hill', 'Brooklyn', 'NY', '11254');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Efrem', 'Winkworth', '410-882-7183', '3 7th Court', 'Baltimore', 'MD', '21265');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Barbra', 'Bythway', '717-143-4877', '7515 Kim Road', 'Harrisburg', 'PA', '17126');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Gennie', 'Rallin', '661-838-9876', '72 Butterfield Pass', 'Palmdale', 'CA', '93591');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Warner', 'Castane', '317-432-4914', '8 Elmside Junction', 'Indianapolis', 'IN', '46239');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Orsola', 'Ketley', '202-628-4218', '52 Ilene Avenue', 'Washington', 'DC', '20591');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Bunnie', 'Van Der Weedenburg', '512-682-3136', '20692 Fordem Point', 'Austin', 'TX', '78754');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Jeddy', 'Killingback', '210-847-7821', '3 Heath Trail', 'San Antonio', 'TX', '78265');
insert into Patients (PatientFirstName, PatientLastName, PatientPhoneNumber, PatientAddress, PatientCity, PatientState, PatientZipCode) values ('Aldis', 'Crunkhorn', '413-134-6601', '66 Westport Place', 'Springfield', 'MA', '01105');
GO

insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-11-10 15:15:22', 3, 7, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-14 08:53:05', 9, 3, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-06-03 15:47:14', 4, 10, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-29 04:08:52', 8, 5, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-03-09 23:11:58', 6, 3, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-02-26 00:24:57', 8, 11, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-03-30 11:28:34', 6, 6, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-11-14 10:57:24', 9, 5, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-03-03 14:48:45', 5, 6, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-03 17:02:32', 7, 4, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-11-20 13:18:35', 4, 4, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-12-04 13:13:39', 5, 8, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-01-18 00:07:27', 7, 3, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-03 04:32:55', 8, 8, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-08-03 15:02:53', 2, 2, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-16 13:10:57', 3, 8, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-24 12:45:20', 5, 10, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-12 13:28:02', 9, 3, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-22 04:52:12', 3, 6, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-06-18 07:59:54', 6, 5, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-31 10:58:50', 4, 5, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-07-22 17:00:05', 3, 11, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-07 23:19:53', 3, 3, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-23 11:35:30', 8, 6, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-08-01 20:41:03', 8, 2, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-27 12:34:25', 2, 5, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-07 20:00:16', 2, 3, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-25 08:03:28', 5, 3, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-07-16 12:32:19', 2, 2, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-02-12 14:28:44', 8, 8, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-07-23 19:25:58', 2, 5, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-20 04:09:42', 9, 9, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-01-15 03:46:04', 5, 3, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-01-09 19:20:13', 6, 7, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-12-05 15:58:51', 6, 5, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-12-17 19:07:04', 4, 5, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-11-27 22:43:05', 9, 8, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-01-07 15:45:48', 2, 7, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-12-23 21:12:42', 5, 9, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-02-27 06:49:48', 11, 7, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-01-27 20:39:23', 10, 11, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-15 04:36:40', 11, 4, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-11 11:59:39', 6, 7, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-30 17:33:15', 7, 3, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-08-21 03:16:17', 7, 7, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-03-07 06:09:34', 10, 10, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-11-09 21:48:40', 11, 11, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-05 17:49:05', 3, 8, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-07-22 00:32:18', 2, 3, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-02-25 17:40:27', 2, 10, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-06 22:16:58', 6, 11, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-11-13 23:18:48', 11, 8, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-28 07:45:48', 8, 4, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-25 05:48:49', 11, 3, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-03-30 01:14:30', 8, 10, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-28 01:41:58', 2, 5, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-11-11 12:22:49', 8, 10, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-07-03 07:50:02', 9, 10, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-09 10:36:05', 5, 11, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-03-18 20:11:04', 2, 6, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-04 10:08:37', 11, 6, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-18 03:40:30', 5, 7, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-20 21:56:09', 10, 4, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-12 21:50:48', 2, 5, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-03-26 08:44:17', 6, 6, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-12-09 00:52:21', 6, 8, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-01-18 01:10:42', 10, 8, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-01-29 10:23:39', 5, 3, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-24 20:23:39', 3, 11, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-04 08:33:56', 10, 11, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-12-26 01:16:40', 10, 6, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-11 09:47:15', 8, 6, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-16 10:30:35', 3, 5, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-20 22:54:51', 4, 11, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-06 05:34:37', 9, 4, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-13 01:24:34', 4, 3, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-08-28 17:23:29', 7, 6, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-01-30 22:32:02', 7, 2, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-12-09 21:24:25', 9, 11, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-11 17:37:12', 3, 8, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-01-25 03:16:04', 4, 2, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-09 20:48:32', 9, 9, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-08-16 02:39:40', 9, 9, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-05 04:30:34', 8, 3, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-06-28 07:57:53', 3, 4, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-07 13:54:38', 4, 9, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-02-07 22:32:23', 3, 8, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2020-01-28 13:51:44', 7, 2, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-08-11 19:34:17', 3, 10, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-17 20:40:11', 7, 2, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-18 17:19:48', 10, 3, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-11-04 17:36:59', 10, 5, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-08 21:54:24', 11, 11, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-08-16 03:16:33', 6, 2, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-30 04:50:10', 6, 2, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-12-16 16:35:15', 10, 7, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-01 09:16:19', 6, 10, 4);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-15 18:23:16', 7, 5, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-22 17:55:14', 5, 6, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-11-09 01:48:11', 3, 6, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-10-18 12:28:55', 4, 9, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-03-10 23:38:55', 4, 8, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-20 02:36:27', 5, 5, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-08-12 12:26:14', 7, 5, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-04-03 07:27:02', 3, 10, 6);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-18 11:01:53', 11, 8, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-09-17 15:16:37', 11, 6, 3);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-03-26 10:08:52', 8, 4, 2);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-05-12 04:51:04', 9, 8, 5);
insert into Appointments (AppointmentDateTime, AppointmentPatientID, AppointmentDoctorID, AppointmentClinicID) values ('2019-12-19 04:37:29', 4, 6, 2);

GO

Create View vDoctorsAppointments
AS
    SELECT
        DoctorName = d.DoctorFirstName + ' ' + d.DoctorLastName,
        PatientName = p.PatientFirstName + ' ' + p.PatientLastName,
        c.ClinicName,
        a.AppointmentDateTime
    FROM Appointments AS a 
    JOIN Patients AS p
    ON p.PatientID = a.AppointmentPatientID
    JOIN Doctors AS d 
    ON d.DoctorID = a.AppointmentDoctorID
    JOIN Clinics AS c 
    ON c.ClinicID = a.AppointmentClinicID
GO

Select * From vDoctorsAppointments