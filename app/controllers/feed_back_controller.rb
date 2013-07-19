class FeedBackController < ApplicationController
  before_action :load_resource, only: [:new,:create]

  def new
    respond_with(@feedback)
  end

  def create
    @feedback.save
    respond_with(@feedback, location: root_url)
  end

  private
  def load_resource
   @feedback = FeedBack.new(feedback_params)
  end

  def feedback_params
    params.require(:feed_back).permit(:subject, :comment) if params[:feed_back]
  end
end
