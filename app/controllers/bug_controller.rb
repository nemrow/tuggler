class BugController < ApplicationController
  def index
    project = Project.find(params[:project_id])
    page = project.pages.where(:route => params[:page_route]).first

    render :json => {
      :bugs => page.bugs
    }.to_json
  end

  def create
    project = Project.find(params[:project_id])
    page = project.pages.where(:route => params[:page_route]).first
    bug = Bug.create(params[:bug])
    page.bugs << bug

    render :json => bug.to_json
  end

  def show
    bug = Bug.find(params[:bug_id])
    render :json => bug.to_json
  end
end
