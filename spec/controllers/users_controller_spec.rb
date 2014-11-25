require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "POST to create" do
    context 'with valid user information' do 
      before do 
         post :create, { :user => { :name => 'Annie', :email => 'annie@annie.com', :password => 'annie', :password_confirmation => 'annie' } }
      end 

      it "should create a user in the database" do 
        expect(User.count).to eq 1
      end 

      it "should redirect to the root path" do 
        expect(response).to redirect_to(root_path)
      end 
    end 

    context 'with invalid user information' do 
      before do 
         post :create, { :user => { :name => 'Annie', :email => 'annie@annie.com', :password => '' } }
      end

      it "shouldn't create a user in the database" do
        expect(User.count).to eq 0
      end 

      it 'should redirect to the root path' do 
        expect(response).to redirect_to(root_path)
      end 
    end 
  end

  describe 'GET to new' do 
    before do 
      get :new
    end 

    it 'should be successful' do 
      expect(response.status).to eql 200
    end 

    it 'should render the new template' do 
      expect(response).to render_template(:new)
    end
  end 

  # describe 'GET to show' do
  #   context 'existing user' do 
  #     before do
  #       post :create, { :user => { :name => 'Annie', :email => 'annie@annie.com', :password => 'annie', :password_confirmation => 'annie' } }
  #       get :show, id: 1
  #     end 
  #     it 'should render the show template for that user' do 
  #       expect(response).to render_templat
  #     end 
  #   end 
  #   context 'non existing user' do 
  #     before do 
  #     end 
  #     it 'should redirect to the root path' do 
  #     end 
  #   end 
  # end 

end
