class User < ApplicationRecord

  has_secure_password
  validates :username, presence: true, uniqueness: true

  has_many :followed_users, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
  has_many :followees, through: :followed_users #Return user instances

  has_many :following_users, foreign_key: :followee_id, class_name: "Follow", dependent: :destroy #Returns Follow instances
  has_many :followers, through: :following_users #Return user instances

  has_many :given_gifts, foreign_key: :giver_id, class_name: "Gift", dependent: :destroy
  has_many :given_gifts_to, through: :given_gifts, source: :receiver

  has_many :received_gifts, foreign_key: :receiver_id, class_name: "Gift", dependent: :destroy
  has_many :received_gifts_from, through: :received_gifts, source: :giver

  has_many :received_gift_items, through: :received_gifts, source: :gift_item
  has_many :given_gift_items, through: :given_gifts, source: :gift_item

  def give_gift_to(receiver_id, gift_item_id)
    Gift.create(giver_id: self.id, receiver_id: receiver_id, gift_item_id: gift_item_id)
  end

  def top_five_gifts
    gifts = self.received_gifts.sort_by {|gift| gift.created_at}.reverse.first(5)
  end


end
