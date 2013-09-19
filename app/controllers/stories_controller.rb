class StoriesController < ApplicationController
  respond_to :html, :js, :json, :pdf

  before_action :authenticate_user!

  def index
    @stories = current_user.stories.order(updated_at: :desc)
  end

  def create
    @story = build_story(story_params)
    @story.save
    respond_with(@story, location: stories_url)
  end

  def edit
  	@story = find_story(params[:id])
  end


  def update
    @story = find_story(params[:id])
  	@story.update(story_params)
    respond_with(@story, location: stories_url)
  end


  def destroy
    @story = find_story(params[:id])
    @story.destroy
    respond_with(@story)
  end

  private
    def build_story(attributes)
      current_user.stories.build(attributes)
    end

    def find_story(id)
      current_user.stories.find(id)
    end

    def story_params
      params.require(:story).permit(:overview, :content, :user_id)
    end

    def interpolation_options
      { resource_name: 'Novel'  ,errors: @story.errors.full_messages.join(',')}
    end
end
