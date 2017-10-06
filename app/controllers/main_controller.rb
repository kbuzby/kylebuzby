class MainController < ApplicationController

  def index
    carPost = Post.where(category: "Car").last
    photoPost = Post.where(category: "Photos").last
    techPost = Post.where(category: "Tech").last

    @latestPosts = {"Car Projects" => carPost, "Photo Posts" => photoPost, "Tech Projects" => techPost}

  end

  def about
  end

  def contact
  end
  
  def keybase
  end

end
