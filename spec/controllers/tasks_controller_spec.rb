require 'spec_helper'

describe TasksController do

  before(:each) do
    @user = User.create
    @page = Page.create
    @project = Project.create
  end

  describe "get 'INDEX'" do
    before do
      @page2 = Page.create(:route => '/sweetness')
      @project.pages << @page2
      2.times do
        task = Task.create
        @page2.tasks << task
      end
    end

    it "gets all tasks from this page" do
      

      get :index, :page_route => '/sweetness', :project_id => @project.id
      json_response = response.body
      JSON.parse(json_response)["tasks"].count.should eq(2)
    end
  end

  describe "GET 'create'" do
    before do
      @page2 = Page.create(:route => "/tots")
      @project.pages << @page2
    end

    it "create a new task for this page" do
      get :create, :project_id => @project.id, :page_route => '/tots', :task => {
        :title => "shits fucked"
      }

      json_response = response.body
      JSON.parse(json_response)["title"].should eq("shits fucked")
    end
  end

  describe "GET 'show'" do
    before do
      @task = Task.create(:title => "wudupp")
      @page.tasks << @task
    end

    it "show one task by id" do
      get :show, :task_id => @task.id
      
      json_response = response.body
      JSON.parse(json_response)["title"].should eq("wudupp")
    end
  end

end
