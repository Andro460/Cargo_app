class PostsController < ApplicationController
    before_action :authenticate_user!, :only => [:new]
                            
    def index
        @post = Post.order('created_at DESC')
    end 
    
    def new
    end   
    
    def show
    @post = Post.find(params[:id])
    end
    
    def create
        @post = Post.new(post_params)
        @post.author = current_user.username
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
        
    end  
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to action: :index
    end
    
    
    private
    def post_params
        params.require(:post).permit(:author, :title, :post, :comments_permit)
    end    
    
    
end
