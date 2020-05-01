class Database < ApplicationRecord

  def self.search(search)
    if search
      Database.where(["ques_s LIKE ? OR answer LIKE ?","%#{search}%", "%#{search}%"])
    else
      Database.all
    end
  end

end
