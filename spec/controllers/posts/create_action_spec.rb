require 'rails_helper'

describe PostsController, '#create', type: [:controller, :post] do
  let(:user) { create(:user) }

  before do
    sign_in user
    xhr :post, :create, post: params
  end


  context 'when params are valid' do
    let(:params) { attributes_for(:post) }

    it 'content type should be JS' do
      expect(response.content_type).to eq Mime::JS
    end

    it 'should render :create template' do
      expect(subject).to render_template :create
    end
  end

  context "when params are invalid" do
    let(:params) { { user_id: 1 } }

    it 'content type should be JS' do
      expect(response.content_type).to eq Mime::JS
    end

    it 'should render :create template' do
      expect(subject).to render_template :create
    end
  end
end
