# Job-Application
This Job Application Management System is a MySQL database project designed to manage job postings, applications, interviews, and job offers efficiently.


Table Relationships (ER Diagram Concept)

[Employers] ------< [JobPostings] ------< [JobApplications] >------ [Applicants]
                         |                           |
                         |                           |
                   [Interviews]               [JobOffers]


Job Application System (MySQL Project)
This Job Application Management System is a MySQL database project designed to manage job postings, applications, interviews, and job offers efficiently.

Key Features:
Employers Table – Stores company details that post job vacancies.
JobPostings Table – Contains job listings with details like title, description, location, and salary.
Applicants Table – Holds information about job seekers, including resumes.
JobApplications Table – Tracks applications with statuses such as Pending, Reviewed, Interview Scheduled, and Hired.
Interviews Table – Manages interview schedules, including dates and modes (Online/In-Person).
JobOffers Table – Handles job offer details, including salary and acceptance status.
This database ensures efficient tracking of the hiring process, from job posting to applicant selection. It provides data integrity and relational consistency through foreign keys and constraints, making it ideal for integration into a web-based job portal



Explanation of Relationships
One Employer can post multiple jobs → (Employers → JobPostings).
One Job Posting can receive multiple applications → (JobPostings → JobApplications).
One Applicant can apply to multiple jobs → (Applicants → JobApplications).
One Job Application can lead to one or more Interviews → (JobApplications → Interviews).
One Job Application can result in one Job Offer → (JobApplications → JobOffers)



Detailed Table Mapping

| **Table Name**       | **Primary Key (PK)**    | **Foreign Keys (FK) & Relationships**                 | **Description**                                  |
|----------------------|------------------------|------------------------------------------------------|------------------------------------------------|
| **Employers**        | `employer_id` (PK)     | -                                                    | Stores employer (company) details.             |
| **JobPostings**      | `job_id` (PK)          | `employer_id` (FK) → Employers                      | Stores job listings posted by employers.       |
| **Applicants**       | `applicant_id` (PK)    | -                                                    | Stores job seeker information.                 |
| **JobApplications**  | `application_id` (PK)  | `job_id` (FK) → JobPostings <br> `applicant_id` (FK) → Applicants | Tracks job applications and their statuses. |
| **Interviews**       | `interview_id` (PK)    | `application_id` (FK) → JobApplications             | Schedules interviews for applicants.           |
| **JobOffers**        | `offer_id` (PK)        | `application_id` (FK) → JobApplications             | Stores job offer details for applicants.       |



