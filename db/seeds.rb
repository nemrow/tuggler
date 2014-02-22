user = User.create(:email => "nemrowj@gmail.com", :password => "password")

project = Project.create(:host_name => "www.pigeonpic.com")

page = Page.create(:route => '/contact')

user.projects << project

project.pages << page

4.times do |num|
  bug = Bug.create(:title => "Bug #{num}", :description => "description for bug number #{num}")
  page.bugs << bug

  2.times do |num|
    comment = Comment.create(:content => "This is a comment for comment number #{num}")
    bug.comments << comment
  end  

  task = Task.create(:title => "Task #{num}", :description => "description for task number #{num}")
  page.tasks << task

  2.times do |num|
    comment = Comment.create(:content => "This is a comment for comment number #{num}")
    task.comments << comment
  end
end