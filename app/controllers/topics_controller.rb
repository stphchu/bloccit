class TopicsController < ApplicationController
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
     @topic = Topic.new
     @topic.name = params[:topic][:name]
     @topic.description = params[:topic][:description]
     @topic.public = params[:topic][:public]
 
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
 
     @topic.name = params[:topic][:name]
     @topic.description = params[:topic][:description]
     @topic.public = params[:topic][:public]
 
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
 
end
