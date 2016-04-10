class SubmitController < ApplicationController
  def _requests
    @submit_requests = SubmitRequest.where(user_id: current_user.id).order(update_at: :desc)
  end

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def approve
  end

  def unapprove
  end

  def reject
  end

  def inbox
  end
end
