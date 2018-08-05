class VotesController < ApplicationController
   before_action :require_sign_in
 
#UP VOTE
   def up_vote
     update_vote(1)
     redirect_back(fallback_location: :root)
   end

#DOWN VOTE
   def down_vote
     update_vote(-1)
     redirect_back(fallback_location: :root)
   end

#PRIVATE
 private
   def update_vote(new_value)
     @post = Post.find(params[:post_id])
     @vote = @post.votes.where(user_id: current_user.id).first
 
     if @vote
       @vote.update_attribute(:value, new_value)
     else
       @vote = current_user.votes.create(value: new_value, post: @post)
     end
   end
end
