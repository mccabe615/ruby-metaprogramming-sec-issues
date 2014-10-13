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
       :salary => 5000
      },
     {
       :name => "Bob",
       :status => "Available",
       :position => "Peon",
       :salary => 5000
     },
     {
       :name => "Jonn",
       :status => "Available",
       :position => "Grunt",
       :salary => 10000
     },
     {
       :name => "Andrew",
       :status => "Available",
       :position => "Captain Kangaroo",
       :salary => 40000
      },
     {
       :name => "Mike",
       :status => "Available",
       :position => "Chief",
       :salary => 50000
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