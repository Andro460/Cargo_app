class CommentsController < ApplicationController
    load_and_authorize_resource
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.author = current_user.username
        @comment.user_id = current_user.id
        @comment.save
        
        redirect_to post_path(@post)
    end 

    def destroy
        @post = Post.find(params[:post_id])
        @comment=@post.comments.find(params[:id])  
        @comment.destroy
       
        redirect_to post_path(@post)
    end 

    private
    def comment_params
        params.require(:comment).permit(:author, :content)
    end 

end
