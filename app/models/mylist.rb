class Mylist < ApplicationRecord
  validates :user_id,{presence: true}
  validates :q_id,{presence: true}

  def database
    return Database.find_by(id: self.q_id)
  end
end
