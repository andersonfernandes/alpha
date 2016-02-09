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

    it 'response status should be 200' do
      expect(response.status).to eq 200
    end
  end

  context "when params are invalid" do
    let(:params) { { user_id: 1 } }

    it 'content type should be JS' do
      expect(response.content_type).to eq Mime::JS
    end

    it "flash[:alert] should be 'This post cannot be posted'" do
      expect(flash[:alert]).to eq 'This post cannot be posted'
    end

    it 'should render :create_fail template' do
      expect(subject).to render_template :create_fail
    end
  end
end
