class ProjectsController < ApplicationController
  def create
    user = User.find(params[:user])
    project = Project.create(params[:project])
  end

  def show
  end
end
