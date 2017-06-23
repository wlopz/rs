module Authors
  class BlogsController < AuthorController
    before_action :set_blog, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

    # GET /blogs
    # GET /blogs.json
    def index
      @blogs = current_author.blogs.most_recent
    end

    # GET /blogs/1
    # GET /blogs/1.json
    def show
    end

    # GET /blogs/new
    def new
      @blog = current_author.blogs.new
    end

    # GET /blogs/1/edit
    def edit
    end

    # PUT /authors/blogs/1/publish
    def publish
      @blog.publish
      redirect_to authors_blogs_url
    end

    # PUT /authors/blogs/1/unpublish
    def unpublish
      @blog.unpublish
      redirect_to authors_blogs_url
    end

    # POST /blogs
    # POST /blogs.json
    def create
      @blog = current_author.blogs.new(blog_params)

      respond_to do |format|
        if @blog.save
          format.html { redirect_to authors_blog_path(@blog), notice: 'Blog was successfully created.' }
          format.json { render :show, status: :created, location: @blog }
        else
          format.html { render :new }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /blogs/1
    # PATCH/PUT /blogs/1.json
    def update
      respond_to do |format|
        if @blog.update(blog_params)
          format.html { redirect_to authors_blog_path(@blog), notice: 'Blog was successfully updated.' }
          format.json { render :show, status: :ok, location: @blog }
        else
          format.html { render :edit }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /blogs/1
    # DELETE /blogs/1.json
    def destroy
      @blog.destroy
      respond_to do |format|
        format.html { redirect_to authors_blogs_url, notice: 'Blog was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = current_author.blogs.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :description, :image, :tag_list)
    end
  end
end


