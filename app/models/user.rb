class User < ActiveRecord::Base
  has_many :projects

  def self.users_with_own_tasks
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
