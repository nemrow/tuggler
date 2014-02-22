class PagesController < ApplicationController
  def create
    {"page"=>{"route"=>"/about_us", "project_id"=>"7"}, "controller"=>"pages", "action"=>"create"}

    page_data = params[:page]
    page = Page.create(:route => page_data['route'])

    project = Project.find(page_data['project_id'])
    project.pages << page
  end

  def show
    project_data = params[:project]
    project = Project.find(project_data["project_id"])
    projects_pages = project.pages
    current_page = projects_pages.where(:route => project_data["route"]).first
    render :json => {
      :page_id => current_page.id,
      :route => current_page.route
    }.to_json
  end
end
