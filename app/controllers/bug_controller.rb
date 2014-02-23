class BugController < ApplicationController
  def index
    project = Project.find(params[:project_id])
    page = project.pages.where(:route => params[:page_route]).first

    render :json => {
      :bugs => page.bugs
    }.to_json
  end

  def create
    user = User.find(params[:user_id])
    project = Project.find(params[:project_id])
    page = project.pages.where(:route => params[:route]).first
    bug = Bug.create(params[:bug])

    if params[:screenshot]
      screenshot = Screenshot.build_screenshot(params[:screenshot])
      bug.screenshots << screenshot
    end

    page.bugs << bug

    page_data = page.get_full_page_hash(user)

    render :json => "#{params[:callback]}(#{page_data.to_json})"
  end

  def show
    bug = Bug.find(params[:bug_id])
    render :json => bug.to_json
  end
end
