class CommentsController < ApplicationController

	def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
           render :comment_create
        else
           render 'posts/show'
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
           render :comment_create
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
