require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    attributes_for(:user)
  end

  let(:invalid_attributes) do
    {
      first_name: nil
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Tenant::UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all users as @users' do
      User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:users)).to match_array(User.ordered)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user as @user' do
      user = User.create! valid_attributes
      get :show, params: { id: user.to_param }, session: valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #new' do
    it 'assigns a new user as @user' do
      get :new, params: {}, session: valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested user as @user' do
      user = User.create! valid_attributes
      get :edit, params: { id: user.to_param }, session: valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, params: { user: valid_attributes }, session: valid_session
        end.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, params: { user: valid_attributes }, session: valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'redirects to the created user' do
        post :create, params: { user: valid_attributes }, session: valid_session
        expect(response).to redirect_to(User.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, params: { user: invalid_attributes }, session: valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, params: { user: invalid_attributes }, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          first_name: 'Jessica'
        }
      end

      it 'updates the requested user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: new_attributes }, session: valid_session
        user.reload
        expect(user.first_name).to eql('Jessica')
      end

      it 'assigns the requested user as @user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: valid_attributes }, session: valid_session
        expect(assigns(:user)).to eq(user)
      end

      it 'redirects to the user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: valid_attributes }, session: valid_session
        expect(response).to redirect_to(user)
      end
    end

    context 'with invalid params' do
      it 'assigns the user as @user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect do
        delete :destroy, params: { id: user.to_param }, session: valid_session
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the master_users list' do
      user = User.create! valid_attributes
      delete :destroy, params: { id: user.to_param }, session: valid_session
      expect(response).to redirect_to(users_url)
    end
  end
end
