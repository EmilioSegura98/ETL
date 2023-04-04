-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT (c.cf_id), c.backers_count
FROM campaign as c
WHERE outcome = 'live'
ORDER BY backers_count DESC;
-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT (b.cf_id), COUNT (b.backer_id) as "total backers"
FROM backers as b
GROUP BY cf_id
ORDER BY "total backers" DESC;
-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT co.first_name,
co.last_name,
co.email,
(c.goal-c.pledged) as "remining goal amount"
INTO email_contacts_remaining_goal_amount
FROM contacts as co
INNER JOIN campaign as c
ON c.contact_id = co.contact_id
WHERE c.outcome = 'live'
ORDER BY "remining goal amount" DESC;
-- Check the table
-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email,
b.first_name,
b.last_name,
b.cf_id,
c.company_name,
c.description,
c.end_date,
(c.goal-c.pledged) as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers as b
LEFT JOIN campaign as c
ON c.cf_id = b.cf_id
WHERE c.outcome = 'live'
ORDER BY b.last_name ASC, email;
-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

