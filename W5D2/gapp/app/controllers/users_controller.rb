class UsersController < ApplicationController
  describe "GET #new" do
    it "renders sign-up page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #create" do
    context 'valid credentials' do
      post :create, params: { user: { username: 'Joe', password: 'password' } }
      user = User.find_by_username('Joe')

      expect(session[:session_token]).to eq(user.session_token)
    end

    context 'invalid credentials' do
      post :create, params: { user: { username: 'Ashil', password: 'passw' } }
      expect(flash[:errors]).to be_present
      expect(response).to render_template('new')
    end
  end
end
