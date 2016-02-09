require 'rails_helper'

describe UsersController, '#my_profile', type: [:controller, :user] do
  let(:user) { create(:user) }

  before do
    sign_in user
    get :my_profile
  end

  it 'should render :my_profile template' do
    expect(subject).to render_template :my_profile
  end
end
