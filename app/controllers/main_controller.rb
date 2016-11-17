class MainController < ApplicationController

  def index
    carPost = Post.where(category: "Car").last
    photoPost = Post.where(category: "Photos").last
    techPost = Post.where(category: "Tech").last

    @latestPosts = {"Car" => carPost, "Photo" => photoPost, "Tech" => techPost}

  end

  def about
  end
  
  def contact
  end

end
