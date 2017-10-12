require 'ostruct'

require 'base_helper'

class UserManager
  include BaseHelper

  # pretend that we are reserving users from some pool
  def reserve
    OpenStruct.new(
      name: "#{rand_str(5)} #{rand_str(5)}",
      email: "#{rand_str(8)}@example.com",
      username: rand_str(8),
      address: rand_str(40)
    )
  end
end
