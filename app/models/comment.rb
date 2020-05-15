class Comment < ApplicationRecord

  def user
    return User.find_by(id: self.user_id)
  end

  def database
    return Database.find_by(id: self.q_id)
  end
end
