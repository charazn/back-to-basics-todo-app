class List < ActiveRecord::Base

  validates :title, :description, presence: true

  enum status: { archived: 0, active: 1, completed: 2 }

end
