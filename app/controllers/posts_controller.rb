class PostsController < ApplicationController
  before_action :require_sign_in, except: :show
  
#SHOW
  def show
    @post = Post.find(params[:id])
  end

#NEW
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

#CREATE
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

#EDIT
  def edit
    @post = Post.find(params[:id])
  end

#UPDATE
  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
 
    if @post.save
      flash[:notice] = "Post was updated."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

#DESTROY
  def destroy
    @post = Post.find(params[:id])
 
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

#PRIVATE
 private
 def post_params
   params.require(:post).permit(:title, :body)
 end
end
