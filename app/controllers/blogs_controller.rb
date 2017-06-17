class BlogsController < ApplicationController

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.most_recent
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.friendly.find(params[:id])
  end

end
