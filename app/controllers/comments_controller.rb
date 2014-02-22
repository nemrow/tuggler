class CommentsController < ApplicationController
  def create
    bug = Bug.find(params[:bug_id]) if params[:bug_id]
    task = Task.find(params[:task_id]) if params[:task_id]

    comment = Comment.create(params[:comment])

    if bug
      bug.comments << comment
    elsif task
      task.comments << comment
    end

    render :json => comment.to_json
  end

  def index
    bug = Bug.find(params[:bug_id]) if params[:bug_id]
    task = Task.find(params[:task_id]) if params[:task_id]

    if bug
      json = bug.comments
    elsif task
      json = task.comments
    end

    render :json => json
  end
end
