class PostsController < ApplicationController
	before_action :correct_user, only: [:destroy]

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

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    def search
        @posts = Post.where(['posts.post_content LIKE(?)', "%#{params[:search]}%"]).order(created_at: :desc)

    end

    def search
		@post_or_comment_or_category=params[:option]
		if    @post_or_comment=="1"
			  @posts = Post.where(['posts.post_content LIKE(?)', "%#{params[:search]}%"]).order(created_at: :desc)
		else  @post_or_comment=="2"
			  @comments = Comment.where(['comments.content LIKE(?)', "%#{params[:search]}%"]).order(created_at: :desc)
		end
	end

	private

	def post_params
        params.require(:post).permit(:user_id, :post_content, category_ids: [])
    end

    def correct_user
	    @post = current_user.posts.find_by(id: params[:id])
	    unless @post
	       redirect_to root_url
	    end
  end

end
