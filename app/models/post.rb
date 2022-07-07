class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_posts_counter
    user.increment!(:posts_counter)
  end
  
  def recent_comments
    comments.last(5)
  end
end
