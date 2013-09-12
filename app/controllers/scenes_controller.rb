class ScenesController < ApplicationController
  respond_to :html, :js, :json, :pdf

  before_action :authenticate_user!



  def index
    @story = Story.find(params[:story_id])
    @scenes = @story.scenes
  end



  # def create
  #   @story = current_user.stories.find(params[:story_id])
  #   @new_scene = @story.scenes.build(scene_params)

  #   if @new_scene.save!
  #      redirect_to :back, :notice => "Scene added successfully"
  #   else
  #      redirect_to :back, :notice => "Error: Unable to save"
  #   end
  # end


  def create
      @story = current_user.stories.find(params[:story_id])
      @scene = @story.scenes.build(scene_params)
      @scene.save
      respond_with([@story,@scene], location: story_scenes_url(@story), :notice => "Your scene has been saved")
  end



  def edit
    @story  = current_user.stories.find(params[:story_id])
  	@scene = Scene.find params[:id]
  end



  def update
  	scene = Scene.find params[:id]
  	if scene.update_attributes(scene_params)
  		redirect_to :back, :notice => "Scene updated successfully"
  	else
  		redirect_to :back, :notice => "There was an error saving the scene"
  	end
  end



  def destroy
  	Scene.destroy params[:id]
  	redirect_to :back, :notice => "The scene was successfully deleted"
  end



# Use the below in Rails 4 instead of the attr_accessible as before
  private
    def scene_params
      params.require(:scene).permit(:title, :scene_content)
    end

end
