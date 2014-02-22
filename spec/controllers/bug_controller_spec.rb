require 'spec_helper'

describe BugController do

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
        bug = Bug.create
        @page2.bugs << bug
      end
    end

    it "gets all bugs from this page" do
      

      get :index, :page_route => '/sweetness', :project_id => @project.id
      json_response = response.body
      JSON.parse(json_response)["bugs"].count.should eq(2)
    end
  end

  describe "GET 'create'" do
    before do
      @page2 = Page.create(:route => "/tots")
      @project.pages << @page2
    end

    it "create a new bug for this page" do
      get :create, :project_id => @project.id, :page_route => '/tots', :bug => {
        :title => "shits fucked"
      }

      json_response = response.body
      JSON.parse(json_response)["title"].should eq("shits fucked")
    end
  end

  describe "GET 'show'" do
    before do
      @bug = Bug.create(:title => "wudupp")
      @page.bugs << @bug
    end

    it "show one bug by id" do
      get :show, :bug_id => @bug.id
      
      json_response = response.body
      JSON.parse(json_response)["title"].should eq("wudupp")
    end
  end

end
