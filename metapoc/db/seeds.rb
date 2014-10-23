# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

emps = [
     {
       :name => "Ken",
       :status => "Available",
       :position => "Peon",
       :salary => 5000,
       :email => "ken@employee.com"
      },
     {
       :name => "Bob",
       :status => "Available",
       :position => "Peon",
       :salary => 5000,
       :email => "bob@employee.com"
     },
     {
       :name => "Jonn",
       :status => "Available",
       :position => "Grunt",
       :salary => 10000,
       :email => "jonn@employee.com"
     },
     {
       :name => "Andrew",
       :status => "Available",
       :position => "Captain Kangaroo",
       :salary => 40000,
       :email => "andy@employee.com"
      },
     {
       :name => "Mike",
       :status => "Available",
       :position => "Chief",
       :salary => 50000,
       :email => "mike@employee.com"
      }
]

users = [
     {
       :name => "Ken",
       :ssn => "123-456-1234",
       :email => "ken@demos.com",
       :standing => "Excellent"
      },
     {
       :name => "Mike",
       :ssn => "432-158-1111",
       :email => "mike@demos.com",
       :standing => "Good"
     }
]

emps.each do |user_info|
	emp = Employee.new
	emp.name = user_info[:name]
	emp.status = user_info[:status]
	emp.position = user_info[:position]
	emp.salary = user_info[:salary]
	emp.save
end

users.each do |user_info|
  user = User.new
  user.name = user_info[:name]
  user.ssn = user_info[:ssn]
  user.email = user_info[:email]
  user.standing = user_info[:standing]
  user.save
end