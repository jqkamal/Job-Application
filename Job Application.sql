-- Create the database
CREATE DATABASE JobApplicationDB;
USE JobApplicationDB;

-- Create table for employers
CREATE TABLE Employers (
    employer_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);

-- Create table for job postings
CREATE TABLE JobPostings (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    employer_id INT,
    job_title VARCHAR(255) NOT NULL,
    job_description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    salary DECIMAL(10,2),
    posted_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employer_id) REFERENCES Employers(employer_id) ON DELETE CASCADE
);

-- Create table for applicants
CREATE TABLE Applicants (
    applicant_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    resume TEXT
);

-- Create table for job applications
CREATE TABLE JobApplications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT,
    applicant_id INT,
    cover_letter TEXT,
    application_status ENUM('Pending', 'Reviewed', 'Accepted', 'Rejected', 'Interview Scheduled', 'Offer Extended', 'Hired') DEFAULT 'Pending',
    applied_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (job_id) REFERENCES JobPostings(job_id) ON DELETE CASCADE,
    FOREIGN KEY (applicant_id) REFERENCES Applicants(applicant_id) ON DELETE CASCADE
);

-- Create table for interview schedules
CREATE TABLE Interviews (
    interview_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT,
    interview_date DATETIME NOT NULL,
    interview_mode ENUM('Online', 'In-Person') NOT NULL,
    interviewer VARCHAR(255),
    FOREIGN KEY (application_id) REFERENCES JobApplications(application_id) ON DELETE CASCADE
);

-- Create table for job offers
CREATE TABLE JobOffers (
    offer_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT,
    offered_salary DECIMAL(10,2),
    offer_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    offer_status ENUM('Pending', 'Accepted', 'Declined') DEFAULT 'Pending',
    FOREIGN KEY (application_id) REFERENCES JobApplications(application_id) ON DELETE CASCADE
);

-- Insert sample data
INSERT INTO Employers (company_name, email, phone, address) VALUES
('Tech Corp', 'contact@techcorp.com', '123-456-7890', '123 Tech Street'),
('Biz Solutions', 'info@bizsolutions.com', '987-654-3210', '456 Biz Avenue');

INSERT INTO JobPostings (employer_id, job_title, job_description, location, salary) VALUES
(1, 'Software Developer', 'Develop and maintain software applications.', 'New York', 85000.00),
(2, 'Project Manager', 'Manage projects and coordinate teams.', 'San Francisco', 95000.00);

INSERT INTO Applicants (full_name, email, phone, resume) VALUES
('John Doe', 'johndoe@example.com', '111-222-3333', 'Experienced developer...'),
('Jane Smith', 'janesmith@example.com', '444-555-6666', 'Project management expert...');

INSERT INTO JobApplications (job_id, applicant_id, cover_letter, application_status) VALUES
(1, 1, 'I am excited to apply for this position...', 'Pending'),
(2, 2, 'I have extensive experience in project management...', 'Pending');

-- Query to retrieve job applications with employer and applicant details
SELECT 
    ja.application_id, 
    j.job_title, 
    e.company_name, 
    a.full_name, 
    ja.application_status, 
    ja.applied_date
FROM JobApplications ja
JOIN JobPostings j ON ja.job_id = j.job_id
JOIN Employers e ON j.employer_id = e.employer_id
JOIN Applicants a ON ja.applicant_id = a.applicant_id;
