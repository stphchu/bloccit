class TopicsController < ApplicationController

   before_action :require_sign_in, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]

#INDEX
   def index
     @topics = Topic.all
   end

#SHOW
   def show
     @topic = Topic.find(params[:id])
   end

#NEW
   def new
     @topic = Topic.new
   end

#CREATE
   def create
     @topic = Topic.new(topic_params)
 
     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash.now[:alert] = "Error creating topic. Please try again."
       render :new
     end
   end

#EDIT
   def edit
     @topic = Topic.find(params[:id])
   end

#UPDATE
   def update
     @topic = Topic.find(params[:id])
     @topic.assign_attributes(topic_params)
 
     if @topic.save
        flash[:notice] = "Topic was updated."
       redirect_to @topic
     else
       flash.now[:alert] = "Error saving topic. Please try again."
       render :edit
     end
   end

#DESTROY
   def destroy
     @topic = Topic.find(params[:id])
 
     if @topic.destroy
       flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the topic."
       render :show
     end
   end

#PRIVATE
  private
  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end 
 
  def authorize_user
    unless current_user.admin? || current_user.moderator?
      flash[:alert] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end
end
