class TasksController < ApplicationController
  def index
    project = Project.find(params[:project_id])
    page = project.pages.where(:route => params[:page_route]).first

    render :json => {
      :tasks => page.tasks
    }.to_json
  end

  def create
    project = Project.find(params[:project_id])
    page = project.pages.where(:route => params[:page_route]).first
    task = Task.create(params[:task])
    page.tasks << task

    render :json => task.to_json
  end

  def show
    task = Task.find(params[:task_id])
    render :json => task.to_json
  end
end
