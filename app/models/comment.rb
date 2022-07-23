class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_destroy :delete_comment

  def update_comments_counter
    post.increment!(:comment_counter)
  end

  def delete_comment
    post.decrement!(:comment_counter)
  end
end
