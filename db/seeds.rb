user = User.create(:email => "nemrowj@gmail.com", :password => "password")

project = Project.create(:host_name => "www.pigeonpic.com")

page = Page.create(:route => '/contact')

user.projects << project

project.pages << page