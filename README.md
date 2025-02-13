# Job-Application
This Job Application Management System is a MySQL database project designed to manage job postings, applications, interviews, and job offers efficiently.


Table Relationships (ER Diagram Concept)

[Employers] ------< [JobPostings] ------< [JobApplications] >------ [Applicants]
                         |                           |
                         |                           |
                   [Interviews]               [JobOffers]



Detailed Table Mapping

| **Table Name**       | **Primary Key (PK)**    | **Foreign Keys (FK) & Relationships**                 | **Description**                                  |
|----------------------|------------------------|------------------------------------------------------|------------------------------------------------|
| **Employers**        | `employer_id` (PK)     | -                                                    | Stores employer (company) details.             |
| **JobPostings**      | `job_id` (PK)          | `employer_id` (FK) → Employers                      | Stores job listings posted by employers.       |
| **Applicants**       | `applicant_id` (PK)    | -                                                    | Stores job seeker information.                 |
| **JobApplications**  | `application_id` (PK)  | `job_id` (FK) → JobPostings <br> `applicant_id` (FK) → Applicants | Tracks job applications and their statuses. |
| **Interviews**       | `interview_id` (PK)    | `application_id` (FK) → JobApplications             | Schedules interviews for applicants.           |
| **JobOffers**        | `offer_id` (PK)        | `application_id` (FK) → JobApplications             | Stores job offer details for applicants.       |
