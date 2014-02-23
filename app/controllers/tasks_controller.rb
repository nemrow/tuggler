class TasksController < ApplicationController
  def index
    project = Project.find(params[:project_id])
    page = project.pages.where(:route => params[:page_route]).first

    render :json => {
      :tasks => page.tasks
    }.to_json
  end

  def create
    user = User.find(params[:user_id])
    project = Project.find(params[:project_id])
    page = project.pages.where(:route => params[:route]).first
    task = Task.create(params[:task])

    if params[:screenshot]
      screenshot = Screenshot.build_screenshot(params[:screenshot])
      task.screenshots << screenshot
    end

    page.tasks << task

    page_data = page.get_full_page_hash(user)

    render :json => "#{params[:callback]}(#{page_data.to_json})"
  end

  def show
    task = Task.find(params[:task_id])
    render :json => task.to_json
  end
end
