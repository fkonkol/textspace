module AuthenticationHelpers 
  def sign_in(user)
    post session_path, params: { email: user.email, password: user.password }
  end

  def sign_out
    delete session_path
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers
end
