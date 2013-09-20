class ScenesController < ApplicationController
  respond_to :html, :js, :json, :pdf

  before_action :authenticate_user!

  def index
    @story = find_story(params[:story_id])
    @scenes = @story.scenes.rank(:row_order)
  end

  def create
      @story = find_story(params[:story_id])
      @scene = build_scene(scene_params)
      @scene.save
      respond_with(@story,@scene,location: story_scenes_url)
  end

  def edit
    @story = find_story(params[:story_id])
  	@scene = find_scene (params[:id])
  end

  def update
    @story = find_story(params[:story_id])
    @scene = find_scene (params[:id])
  	@scene.update(scene_params)
    respond_with(@story, @scene, location: story_scenes_url)
  end

  def destroy
    @story = find_story(params[:story_id])
    @scene = find_scene (params[:id])
    @scene.destroy
    respond_with(@story, @scene)
  end

# Use the below in Rails 4 instead of the attr_accessible as before
  private
    def find_story(id)
      current_user.stories.find(id)
    end

    def find_scene(id)
      @story.scenes.find(id)
    end

    def build_scene(attributes)
      @story.scenes.build(attributes)
    end

    def scene_params
      params.require(:scene).permit(:title, :scene_content, :row_order_position)
    end

end
