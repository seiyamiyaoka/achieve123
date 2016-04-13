class Taskline::TasksController < ApplicationController
  def ungoodjob
  end

  def goodjob
    gdcount = Goodjob.where(task_id: goodjob_params[:task_id], user_id: current_user.id).count
    if gdcount == 0
      @gjb = Goodjob.create(user_id: current_user.id, task_id: goodjob_params[:task_id], number: 1)
    else
      @gjb = Goodjob.find_by(user_id: current_user.id, task_id: goodjob_params[:task_id])
      @gjb.number += 1
      @gjb.update(user_id: current_user.id)
    end
      @gjb_all_cnt = Goodjob.where(task_id: goodjob_params[:task_id]).sum(:number)
    respond_to do |format|
      format.js
    end
  end

  def index
    @feed_tasks = Task.all
    @taskcomment = TaskComment.new
    @goodjobs = Goodjob.new
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :user_id, :charge_id, :deadline, :done, :status)
  end

  def task_comment_params
    params.require(:comment).permit(:user_id, :task_id, :content)
  end

  def goodjob_params
    params.require(:goodjob).permit(:user_id, :task_id, :number)
  end
end
