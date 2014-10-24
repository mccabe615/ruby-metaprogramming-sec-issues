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

clients = [
     {
       :name => "Big Company A",
       :status => "In Progress",
       :email => "poc@bigcompany.com"
      },
     {
       :name => "Target",
       :status => "Completed",
       :email => "poc@target.com"
     },
     {
       :name => "Acme Inc.",
       :status => "Started",
       :email => "poc@acmeinc.com"
     },
     {
       :name => "TrueBlue",
       :status => "Complete",
       :email => "poc@trueblue.com"
      },
     {
       :name => "WhiteRabbit",
       :status => "In Progress",
       :email => "poc@whiterabbit.com"
      }
]

articles = [
     {
       :name => "How to Bake Cookies",
       :body => "In Progress",
       :type => "Instructional"
      },
     {
       :name => "How to paint your face",
       :body => "In Progress",
       :type => "Instructional"
      },
     {
       :name => "Goats...the real Mammal",
       :body => "In Progress",
       :type => "Special Interest"
      }
]

attachments = [
     {
       :name => "Resume",
       :filetype => "doc"
      },
      {
       :name => "Personal Budget",
       :filetype => "xls"
      },
      {
       :name => "Catz",
       :filetype => "png"
      },
      {
       :name => "Apples",
       :filetype => "jpg"
      }
]

reports = [
      {
        :name => "Finances",
        :body => "Bob,1000,Mary,2000000,Joe,90000",
        :filetype => "xls"
      },
      {
        :name => "New Hires",
        :body => "Andy, Craig, Paul",
        :filetype => "doc"
      },
      {
        :name => "CorpLogo",
        :body => "Picture in my Head",
        :filetype => "jpg"
      }
]

emps.each do |user_info|
	emp = Employee.new
	emp.name = user_info[:name]
	emp.status = user_info[:status]
	emp.position = user_info[:position]
	emp.salary = user_info[:salary]
  emp.email = user_info[:email]
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

clients.each do |user_info|
  client = Client.new
  client.name = user_info[:name]
  client.email = user_info[:email]
  client.status = user_info[:status]
  client.save
end

articles.each do |art_info|
  article = Article.new
  article.name = art_info[:name]
  article.body = art_info[:body]
  article.type = art_info[:type]
  article.save
end

attachments.each do |att_info|
  atth = Attachment.new
  atth.name = att_info[:name]
  atth.filetype = att_info[:filetype]
  atth.save
end

reports.each do |rep_info|
  rep = Report.new
  rep.name = rep_info[:name]
  rep.body = rep_info[:body]
  rep.filetype = rep_info[:filetype]
  rep.save
end

