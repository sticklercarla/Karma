class GiftItem < ApplicationRecord
  has_many :gifts
  has_many :receivers, through: :gifts, source: :receiver
  has_many :givers, through: :gifts, source: :giver

  validates :item, presence: true, uniqueness: true, length: { maximum: 15}

  def receiver_usernames
    self.receivers.pluck(:username)
  end
end
