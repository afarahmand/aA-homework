require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { User.create({ username: 'Ashil', password: 'password' }) }

  describe "GET #new" do
    it "renders sign-in page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'valid credentials' do
      it 'creates a new user' do
        post :create, params: { user: { username: 'Joe', password: 'password' } }
        user = User.find_by_username('Joe')

        expect(session[:session_token]).to eq(user.session_token)
      end
    end

    context 'invalid credentials' do
      it 'returns to the new user sign-up page when invalid credentials and shows errors' do
        post :create, params: { user: { username: 'Ashil', password: 'passw' } }
        expect(flash[:errors]).to be_present
        expect(response).to render_template('new')
      end
    end
  end
end
