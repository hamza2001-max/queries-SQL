-- perform a natural join on two tables.
select
    *
from
    patients
    natural join admissions;

-- perform a natural join on two tables with where clause.
select
    *
from
    patients
    natural join admissions
where
    gender = 'M';

-- Show first name, last name, and the full province name of each patient.
select
    first_name,
    last_name,
    province_name
from
    patients
    natural join province_names;

-- Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
select
    patient_id,
    first_name,
    last_name
from
    patients
    natural join admissions
where
    diagnosis = 'Dementia';

-- perform join on two tables with using clause.
SELECT
    *
FROM
    patients
    join admissions using (patient_id);

-- using the on clause with join.
select
    first_name,
    last_name,
    count(*)
from
    admissions
    join doctors on attending_doctor_id = doctor_id
group by
    attending_doctor_id;

-- Show first_name, last_name, and the total number of admissions attended for each doctor.
select
    doctor_id,
    concat (first_name, " ", last_name) as full_name,
    max(admission_date) as first_adm,
    min(admission_date) AS last_adm
from
    doctors
    join admissions on attending_doctor_id = doctor_id
group by
    doctor_id;

-- Display the total amount of patients for each province. Order by descending.
select
    count(*) as total_patients,
    province_name
from
    patients
    natural join province_names
group by
    province_name
order by
    total_patients desc;

-- For every admission, display the patient's full name, their admission diagnosis, and their doctor's 
-- full name who diagnosed their problem.
select
    concat (p.first_name, " ", p.last_name) as patient_full_name,
    a.diagnosis,
    concat (d.first_name, " ", d.last_name) as doctor_full_name
from
    patients as p
    natural join admissions as a
    join doctors d on (a.attending_doctor_id = d.doctor_id);

-- Show patient_id, first_name, last_name, and attending doctor's specialty.
SELECT
    a.patient_id,
    p.first_name,
    p.last_name,
    d.specialty
from
    patients p
    natural join admissions a
    join doctors d on (a.attending_doctor_id = d.doctor_id)
where
    a.diagnosis = 'Epilepsy'
    and d.first_name = 'Lisa';

-- All patients who have gone through admissions, can see their medical documents on our site. Those patients
-- are given a temporary password after their first admission. Show the patient_id and temp_password.
-- The password must be the following, in order:
-- 1. patient_id
-- 2. the numerical length of patient's last_name
-- 3. year of patient's birth_date
select distinct
    a.patient_id,
    concat (
        a.patient_id,
        len (p.last_name),
        year (p.birth_date)
    ) as temp_password
from
    patients p
    natural join admissions a;

-- Show unique first names from the patients table which only occurs once in the list.
select
    first_name
from
    patients
group by
    first_name
having
    count(*) = 1;