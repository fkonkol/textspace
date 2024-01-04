require 'rails_helper'

RSpec.describe 'log out', type: :request do
  let(:user) { create(:user) }

  it 'disallows user to log out without being logged in' do
    sign_out
    expect(response).to redirect_to(new_session_path)
  end
end
