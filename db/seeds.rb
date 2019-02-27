# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


Company.where(name: 'Food Company', subdomain: 'foodco').first_or_create!
Apartment::Tenant.switch!('foodco')

admin = User.where(email: 'admin@foodco.com').first
admin ||= User.new(email: 'admin@foodco.com')
admin.password = '123123'
admin.admin = true
admin.save

user1 = User.where(email: 'employee1@foodco.com').first
user1 ||= User.new(email: 'employee1@foodco.com')
user1.password = '123123'
user1.save

user2 = User.where(email: 'employee2@foodco.com').first
user2 ||= User.new(email: 'employee2@foodco.com')
user2.password = '123123'
user2.save

department1 = Department.where(name: 'Tech').first_or_create!
department2 = Department.where(name: 'Sales').first_or_create!
Department.where(name: 'Default').first_or_create!

adminEmployee = admin.employee || admin.build_employee
adminEmployee.department_id = department1.id
adminEmployee.name = "Admin User"
adminEmployee.phone = "1111111111"
adminEmployee.address = "123 Main St."
adminEmployee.save

user1Employee = user1.employee || user1.build_employee
user1Employee.department_id = department1.id
user1Employee.name = "Foodco Employee1"
user1Employee.phone = "2222222222"
user1Employee.address = "321 Elm St."
user1Employee.save

user2Employee = user2.employee || user2.build_employee
user2Employee.department_id = department2.id
user2Employee.name = "Foodco Employee2"
user2Employee.phone = "3333333333"
user2Employee.address = "222 Walnut St."
user2Employee.save

adminCompensation = adminEmployee.compensation || adminEmployee.build_compensation
adminCompensation.salary = 200000
adminCompensation.bonus = 20
adminCompensation.save

user1Compensation = user1Employee.compensation || user1Employee.build_compensation
user1Compensation.salary = 120000
user1Compensation.bonus = 10
user1Compensation.save

user2Compensation = user2Employee.compensation || user2Employee.build_compensation
user2Compensation.salary = 100000
user2Compensation.bonus = 8
user2Compensation.save



Company.where(name: 'Pharma Company', subdomain: 'pharmaco').first_or_create!
Apartment::Tenant.switch!('pharmaco')

admin = User.where(email: 'admin@pharmaco.com').first
admin ||= User.new(email: 'admin@pharmaco.com')
admin.password = '123123'
admin.admin = true
admin.save

user1 = User.where(email: 'employee1@pharmaco.com').first
user1 ||= User.new(email: 'employee1@pharmaco.com')
user1.password = '123123'
user1.save

user2 = User.where(email: 'employee2@pharmaco.com').first
user2 ||= User.new(email: 'employee2@pharmaco.com')
user2.password = '123123'
user2.save

department1 = Department.where(name: 'Tech').first_or_create!
department2 = Department.where(name: 'Sales').first_or_create!
Department.where(name: 'Default').first_or_create!

adminEmployee = admin.employee || admin.build_employee
adminEmployee.department_id = department1.id
adminEmployee.name = "Admin User"
adminEmployee.phone = "4444444444"
adminEmployee.address = "321 Main St."
adminEmployee.save

user1Employee = user1.employee || user1.build_employee
user1Employee.department_id = department1.id
user1Employee.name = "Pharmaco Employee1"
user1Employee.phone = "5555555555"
user1Employee.address = "345 West St."
user1Employee.save

user2Employee = user2.employee || user2.build_employee
user2Employee.department_id = department2.id
user2Employee.name = "Pharmaco Employee2"
user2Employee.phone = "6666666666"
user2Employee.address = "543 Ridge St."
user2Employee.save

adminCompensation = adminEmployee.compensation || adminEmployee.build_compensation
adminCompensation.salary = 150000
adminCompensation.bonus = 12
adminCompensation.save

user1Compensation = user1Employee.compensation || user1Employee.build_compensation
user1Compensation.salary = 100000
user1Compensation.bonus = 8
user1Compensation.save

user2Compensation = user2Employee.compensation || user2Employee.build_compensation
user2Compensation.salary = 80000
user2Compensation.bonus = 6
user2Compensation.save
