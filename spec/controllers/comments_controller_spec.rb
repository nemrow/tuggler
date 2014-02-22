require 'spec_helper'

describe CommentsController do

  before(:each) do
    @user = User.create
    @project = Project.create
    @page = Page.create
    @project.pages << @page
    @bug = Bug.create
    @task = Task.create
    @page.bugs << @bug
    @page.tasks << @task
  end

  describe "GET 'create'" do
    it "creates a new comment for a bug" do
      get :create, :bug_id => @bug.id, :comment => {:content => "Im buggin"}

      json_response = response.body
      JSON.parse(json_response)["content"].should eq("Im buggin")
    end
  end

  describe "GET 'create'" do
    it "creates a new comment for a task" do
      get :create, :task_id => @task.id, :comment => {:content => "Im buggin"}

      json_response = response.body
      JSON.parse(json_response)["content"].should eq("Im buggin")
    end
  end

  describe "GET 'index'" do
    before do 
      2.times do
        comment = Comment.create
        @bug.comments << comment
      end
    end
    it "returns all comments for this bug" do
      get :index, :bug_id => @bug.id

      json_response = response.body
      JSON.parse(json_response).count.should eq(2)
    end
  end

end
