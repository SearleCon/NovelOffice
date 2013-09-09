class StoriesController < ApplicationController
  respond_to :html, :js, :json, :pdf

  before_action :authenticate_user!



  def index
  	@story = Story.new
    @stories = current_user.stories.order("updated_at DESC")
  end



  def create
    @new_story = current_user.stories.build(story_params)
    if @new_story.save!
       redirect_to :back, :notice => "Novel added successfully"
    else
       redirect_to :back, :notice => "Error: Unable to save"
    end
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
      params.require(:story).permit(:overview, :content, :user_id)
    end  
end
