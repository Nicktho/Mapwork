require 'rails_helper'

RSpec.describe SessionController, :type => :controller do
	before do 
		User.create name: 'Nick', email: "test@test.com", password: 'testing123'
	end

	describe 'GET to new' do 
		it 'should render the login form' do 
			get :new
			expect(response).to render_template(:new)
		end 
	end  

	describe 'POST to create' do 
		context 'with valid credentials' do 
			before do 
				post :create, {name: "Nick", password: "testing123"}
			end 
			it 'should log the user in' do 
				expect(session[:user_id]).to eql User.last.id
			end 
			it 'should redirect to the root_path' do 
				expect(response).to redirect_to root_path
			end 
		end
		context 'with invalid creditials' do 
			before do 
				post :create, {name: "Nick", password: "testing"}
			end 
			it "shouldn't log the user in" do 
				expect(session[:user_id]).to eql nil 
			end 
			it "should redirect to the root_path" do 
				expect(response).to redirect_to root_path
			end
			it "should set errors" do 
				expect(assigns(:error)).to eql "Login Incorrect"
			end  
		end 
	end 

	describe 'GET to destroy' do 
		before do
		  get :destroy
		end
		it 'should log the user out' do 
			expect(session[:user_id]).to eql nil
		end 
		it 'should redirect them to the root path' do
			expect(response).to redirect_to root_path
		end 
	end 
end
