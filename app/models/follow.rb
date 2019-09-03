class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"

  def top_five_followers
    @followers = self.followers.sort_by {|follow| gift.created_at}.reverse.first(5)
  end

  def top_five_following
    @followees = self.following.sort_by {|follow| gift.created_at}.reverse.first(5)
  end

end
