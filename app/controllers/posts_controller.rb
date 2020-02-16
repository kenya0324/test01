class PostsController < ApplicationController

	def index
        @posts = Post.all.order(created_at: :desc)
	end

	def show
		@post = Post.find(params[:id])
        @comment = Comment.new
        @comments = @post.comments
	end

	def new
		@post = Post.new

	end

	def create
	    @post = Post.new(post_params)
	    @post.user_id = current_user.id
	    if @post.save
	        render :create
	    else
	        render :create_error
	    end
    end

    def search
        @posts = Post.where(['posts.post_content LIKE(?)', "%#{params[:search]}%"]).order(created_at: :desc)
    end

	private

	def post_params
        params.require(:post).permit(:user_id, :post_content, category_ids: [])
    end

end
