require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it 'レスポンスコードが200であること' do
      get new_user_path
      expect(response).to have_http_status(:ok)
    end
    it 'newテンプレートをレンダリングすること' do
      get new_user_path
      expect(response).to render_template :new
    end
    it '新しいuserオブジェクトがビューに渡されること' do
      get new_user_path
      expect(assigns(:user)).to be_a_new User
    end
  end
end
