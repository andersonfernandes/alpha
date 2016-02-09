require 'rails_helper'

describe UsersController, '#show', type: [:controller, :user] do
  let(:user) { create(:user) }
  let(:user_2) { create(:user) }

  before do
    sign_in user
    get :show, id: user_2.id
  end

  it 'should assign user_2 to @user' do
    expect(assigns(:user)).to eq user_2
  end

  it 'should render :show template' do
    expect(subject).to render_template :show
  end
end
