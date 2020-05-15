class User < ApplicationRecord
  validates :user_name, {presence: true, uniqueness: true}
  validates :pass, {presence: true}


  def comments
    return Comment.where(user_id: self.id)
  end
end
