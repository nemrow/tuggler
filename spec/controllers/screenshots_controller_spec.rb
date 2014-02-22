require 'spec_helper'

describe ScreenshotsController do

  before(:each) do
    @comment = Comment.create
    @bug = Bug.create
    @task = Task.create
    @comment = Comment.create
  end

  describe "GET 'create'" do
    it "creates a new screenshot for a bug" do
      get :create, :bug_id => @bug.id, :screenshot => {:image_url => "www.yowza.com"}

      json_response = response.body
      JSON.parse(json_response)["image_url"].should eq("www.yowza.com")
    end

    it "creates a new screenshot for a task" do
      get :create, :task_id => @task.id, :screenshot => {:image_url => "www.yowza.com"}

      json_response = response.body
      JSON.parse(json_response)["image_url"].should eq("www.yowza.com")
    end

    it "creates a new screenshot for a comment" do
      get :create, :comment_id => @comment.id, :screenshot => {:image_url => "www.yowza.com"}

      json_response = response.body
      JSON.parse(json_response)["image_url"].should eq("www.yowza.com")
    end
  end

  describe "GET 'index'" do

    it "get all screenshots for a bug" do
      2.times do
        screenshot = Screenshot.create
        @bug.screenshots << screenshot
      end

      get :index, :bug_id => @bug.id
      
      json_response = response.body
      JSON.parse(json_response).count.should eq(2)
    end

    it "get all screenshots for a task" do
      2.times do
        screenshot = Screenshot.create
        @task.screenshots << screenshot
      end

      get :index, :task_id => @task.id
      
      json_response = response.body
      JSON.parse(json_response).count.should eq(2)
    end

    it "get all screenshots for a comment" do
      2.times do
        screenshot = Screenshot.create
        @comment.screenshots << screenshot
      end

      get :index, :comment_id => @comment.id
      
      json_response = response.body
      JSON.parse(json_response).count.should eq(2)
    end
  end

  describe "GET 'show'" do
    before do
      @screenshot2 = Screenshot.create(:image_url => "www.pigeonpic.com")
    end
    it "get a screenshot by its id" do
      get :show, :screenshot_id => @screenshot2.id 

      json_response = response.body
      p json_response
      JSON.parse(json_response)["image_url"].should eq("www.pigeonpic.com")
    end
  end

end
