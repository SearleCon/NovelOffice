class StoriesController < ApplicationController
  respond_to :html, :js, :json, :pdf

  before_action :authenticate_user!

  def index
  	@story = Story.new
  	@stories = Story.all
  end

  def create
  	# render :text => params.inspect
  	Story.create(story_params)
  	redirect_to :back
  end

  def edit
  	@story = Story.find params[:id]
  end

  def update
  	story = Story.find params[:id]
  	if story.update_attributes(story_params)
  		redirect_to stories_path, :notice => "Novel details updated successfully"
  	else
  		redirect_to :back, :notice => "There was an error updating your Novel"
  	end
  end

  def destroy
  	Story.destroy params[:id]
  	redirect_to :back, :notice => "The Novel was successfully deleted"
  end

# Use the below in Rails 4 instead of the attr_accessible as before
  private
    def story_params
      params.require(:story).permit(:overview, :content)
    end  
end
