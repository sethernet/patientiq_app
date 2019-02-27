# Multitenant PatientIQ App

###### Prerequisites

* Ruby version: '2.3.7'

###### App Setup
* bundle install

###### Database Setup

* rake db:setup
    - this will create the db and run the seeds.rb file

###### Run the App
* rails s

###### Usage
* Navigate to http://foodco.lvh.me:3000/ or http://pharmaco.lvh.me:3000/
* The seeds.rb file has populated the db with some sample data, including two tenants 
(Food Company - foodco and Pharma Company - pharmaco) that can be accessed by their subdomains in
the links above
* The seeds file also creates test Users, which are dually Employees, and it creates Compensation 
records for the Employees and Departments that the Employees belong to
* You can log in as an Admin with admin@foodco.com or admin@pharmaco.com (depending on which subdomain
 you are on). Some user logins are employee1@foodco.com or employee1@pharmaco.com. 
 The password for all sample users is "123123". (See the seeds.rb file for additional info on what was
 prepopulated)
* Once logged in, an Admin can create additional Departments and edit Employee or Company info.
* Note that new Employees can be created, but they are attached to Users. So in order to create a 
new Employee, you must navigate to "users/sign_up". Upon signing up, an Employee record is automatically 
created and added to the Default Department. Department information for this Employee can
then be updated on the Employee's profile page. 
* The Summary Report shows the top three earners from each Department

###### How to run the test suite
* rails test


