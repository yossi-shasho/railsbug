class User < ActiveRecord::Base
  has_many :projects

  def self.user_with_own_tasks(email)
    User
    .where(
        Project
        .joins(:tasks)
        .where('users.email = tasks.email')
        .exists
    )
    .distinct
  end
end
