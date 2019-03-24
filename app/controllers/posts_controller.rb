class PostsController < ApplicationController
    before_action :authenticate_user!, :only => [:new]
    load_and_authorize_resource
  

    def my_posts
        if user_signed_in?
            @post = Post.where  author: current_user.username
        else
            redirect_to action: :index
        end
    end 
    
    def index
        @post = Post.order('created_at DESC')
    end 
    
    def new
    end   
    
    def show
    @post = Post.find(params[:id])
    end
    
    def create
       @user=current_user
        @post = @user.posts.build(post_params)
        @post.author = @user.username
        if @post.save
            flash[:notice] = 'Объявление добавлено!'
            redirect_to @post
        else
            render action: 'new'
        end
    end  

    def edit 
        @post = Post.find(params[:id])
    end

    def update
       @post = Post.find(params[:id]) 

       if @post.update(post_params)
        redirect_to @post
       else
        render action: 'edit'
       end 
    end  
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to request.referer.present? ? request.referer : default_path
    end
    
    def upvote
        @post = Post.find(params[:id])
        @post.upvote_from current_user    
        redirect_to @post
       
    end

    def downvote
        @post = Post.find(params[:id])
        @post.downvote_from current_user
        redirect_to @post
    end



    private
    def post_params
        params.require(:post).permit(:author, :title, :post, :comments_permit)
    end    
    
    
end
