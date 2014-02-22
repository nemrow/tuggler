require 'spec_helper'
require 'debugger'

describe UsersController do

  before(:each) do
    @user = User.create(:name => 'J')
  end

  describe "GET 'create'" do
    it "adds a user" do
      user_count = User.all.count
      post :create, :user => {:name => "Jordan"}
      User.all.count.should eq(user_count + 1)
    end
  end

end
