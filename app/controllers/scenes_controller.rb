class ScenesController < ApplicationController
  respond_to :html, :js, :json, :pdf

  before_action :authenticate_user!

  def index
  	@scene = Scene.new
    @scenes = Scene.find_all_by_user_id(current_user.id)
  end

  def create
  	 # render :text => params.inspect

    @new_scene = current_user.scenes.build(scene_params)
    if @new_scene.save!
       redirect_to :back, :notice => "Scene added successfully"
    else
       redirect_to :back, :notice => "Error: Unable to save"
    end
  end

  def edit
  	@scene = Scene.find params[:id]
  end

  def update
  	scene = Scene.find params[:id]
  	if scene.update_attributes(scene_params)
  		redirect_to scenes_path, :notice => "Scene updated successfully"
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
      params.require(:scene).permit(:title, :scene_content, :user_id, :story_id)
    end

end
