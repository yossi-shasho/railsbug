class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, as: :taskable

end
