class PostsController < ApplicationController
  def index
# #11
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
