class SubmitController < ApplicationController
  before_action :set_submit_request, only: [:approve, :unapprove, :reject]
  before_action :set_submit_request_user, only: [:show, :destroy, :edit, :update]

  def index
    @submit_requests = Submit.where(user_id: current_user.id).order(updated_at: :desc)
  end

  def new
    @users = User.friend_user(current_user)
    @task = Task.where.not(id: Submit.select(:task_id)).where(user_id: current_user.id, done: false)
    @submit_request = current_user.submits.build(status: 1)
    @user = @submit_requests
  end

  def destroy
    @submit_request.destroy
    @submit_requests = Submit.where(user_id: current_user.id).order(updated_at: :desc)
    respond_to do |format|
      format.js { render :reject, notice: '削除されました' }
    end
  end

  def create
    @submit_request = Submit.new(submit_request_params)
    respond_to do |format|
      if @submit_request.save
        @submit_request.task.update(status: 1)
        format.html { redirect_to user_submit_index_path(current_user), notice: 'Successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
    @users = User.friend_user(current_user)
    @task = Task.where.not(id: Submit.select(:task_id)).where(user_id: current_user.id, done: false)
  end

  def update
    respond_to do |format|
      if @submit_request.update(submit_request_params)
        @submit_request.task.update(charge_id: submit_request_params[:charge_id])
        format.html { redirect_to user_submit_index_path(user_id: @submit_request.user_id), notice: 'successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def approve
    @submit_request.update(status: 2)
    @submit_request.task.update(status: 2)
    @submit_requests = Submit.where(charge_id: current_user.id).order(updated_at: :desc)

    respond_to do |format|
      format.js
    end
  end

  def unapprove
    @submit_request.update(status: 9)
    @submit_request.task.update(status: 9, charge_id: @submit_request.user_id)
    @submit_requests = Submit.where(charge_id: current_user.id).order(updated_at: :desc)

    respond_to do |format|
      format.js
    end
  end

  def reject
    @submit_request.update(status: 8)
    @submit_request.task.update(status: 8, charge_id: current_user.id)
    @submit_requests = Submit.where(user_id: current_user.id).order(updated_at: :desc)
    respond_to do |format|
      format.js
    end
  end

  def inbox
    @submit_requests = Submit.where(charge_id: current_user.id).order(updated_at: :desc)
  end

  private

  def set_submit_request
    @submit_request = Submit.find(params[:submit_id])
  end

  def set_submit_request_user
    @submit_request = Submit.find(params[:id])
  end

  def submit_request_params
    params.require(:submit).permit(:task_id, :user_id, :charge_id, :status, :message)
  end
end
