require 'rails_helper'

RSpec.describe MappingsController, :type => :controller do
  before do 
  end 
  describe "GET to index" do 
    context "without passing a user id" do 
      before do 
        get :index 
      end 
      it "should return status ok" do 
        expect(response.status).to eql 200
      end 
      it "should return all mappings" do 
        expect(assings[:mappings]).to eql Mapping.all
      end 
    end 
  end 
end
