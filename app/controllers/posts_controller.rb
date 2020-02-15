class PostsController < ApplicationController

	def index

	end

	def show

	end

	def new
		@post = Post.new

	end

	def create

	end

	private

	def post_params
        params.require(:post).permit(:user_id, :category_ids [], :post_content)
    end

end
