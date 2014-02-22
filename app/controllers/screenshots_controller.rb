class ScreenshotsController < ApplicationController
  def create
    bug = Bug.find(params[:bug_id]) if params[:bug_id]
    task = Task.find(params[:task_id]) if params[:task_id]
    comment = Comment.find(params[:comment_id]) if params[:comment_id]

    screenshot = Screenshot.create(params[:screenshot])

    if bug
      bug.screenshots << screenshot
    elsif task
      task.screenshots << screenshot
    elsif comment
      comment.screenshots << screenshot
    end

    render :json => screenshot.to_json
  end

  def index
    bug = Bug.find(params[:bug_id]) if params[:bug_id]
    task = Task.find(params[:task_id]) if params[:task_id]
    comment = Comment.find(params[:comment_id]) if params[:comment_id]

    if bug
      json = bug.screenshots
    elsif task
      json = task.screenshots
    elsif comment
      json = comment.screenshots
    end

    render :json => json
  end

  def show
    screenshot = Screenshot.find(params[:screenshot_id])
    render :json => screenshot.to_json
  end
end
