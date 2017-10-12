require 'user_manager'

class World
  def user(idx)
    @users ||= []
    if @users[idx]
      @users[idx]
    else
      @users[idx] = user_manager.reserve
    end
  end

  def user_manager
    UserManager.new
  end

  def teardown
    # lets pretend we release users to the pool
    @users.each{|u| u&.release}
  end
end
