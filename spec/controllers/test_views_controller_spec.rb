require 'spec_helper'

describe TestViewsController do

  describe "GET 'bugs'" do
    it "returns http success" do
      get 'bugs'
      response.should be_success
    end
  end

  describe "GET 'tasks'" do
    it "returns http success" do
      get 'tasks'
      response.should be_success
    end
  end

end
