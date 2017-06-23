class BlogsController < ApplicationController

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = storage.list_for(params[:page], params[:tag])
    #### MOVED TO MODELS/BLOG
    # if params[:tag].present?
    #   @blogs = storage.most_recent.tagged_with(params[:tag]).paginate(:page => params[:page], per_page: 3)
    # else
    #   @blogs = storage.most_recent.paginate(:page => params[:page], per_page: 3)
    # end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = storage.friendly.find(params[:id])
  end

  private

  def storage
    Blog.published
  end

end
