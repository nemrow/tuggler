require 'spec_helper'

describe PagesController do

  before(:each) do
    @user = User.create
    @project = Project.create
  end

  describe "should create a page" do
    it "returns http success" do
      page_count = Page.all.count
      get :create, :page => {:route => "/about_us", :project_id => @project.id}
      Page.all.count.should eq(page_count + 1)
      @project.pages.last.should eq(Page.last)
    end
  end

  describe "show should find the page by route" do
    before do
      @page = Page.create(:route => '/about_us')
      @project.pages << @page
    end

    it "returns http success" do

      expected_response = {
        :page_id => @page.id,
        :route => '/about_us'
      }.to_json

      get :show, :project => {:project_id => @project.id, :route => '/about_us'}
      response.body.should eq(expected_response)
    end
  end

end
