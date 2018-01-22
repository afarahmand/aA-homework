require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders new template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'redirects user to links index on success' do
        post :create, params: { user: { username: 'Ashil1', password: 'password' } }
        expect(response).to have_http_status(:success)
      end

      it 'signs in the user' do
        post :create, params: { user: { username: 'Ashil1', password: 'password' } }
        user = User.find_by_username('Ashil1')
        sign_in(user)

        expect(session[:session_token]).to eq(user.session_token)
      end
    end

    context 'with invalid params' do
      it 'validates the presence of username, password_digest, and session_token' do
        post :create, params: {user: {username: 'Jones', password: 'short'}}
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end
    end
  end

end
