require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = User.create! email: 'rails@bug.com'
    @project = Project.create! user: @user
  end

  describe '#user_with_own_tasks' do
    it 'should find a user that has a project with a task that has it\'s own email' do
      @task = Task.create! taskable: @project, email: @user.email
      expect(User.user_with_own_tasks(@user.email)).to == [@user]
    end

  end
end
