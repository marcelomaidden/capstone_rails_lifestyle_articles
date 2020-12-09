require 'rails_helper'

RSpec.describe User, type: :model do
  context "Create an user" do
    it "Create a valid user" do      
      @user = User.new(name: 'Marcelo', username: 'marcelomaidden')

      expect(@user).to be_valid
    end

    it "Validates user without a name" do      
      @user = User.new(username: 'marcelomaidden')

      expect(@user).to_not be_valid
    end

    it "Validates user without username" do      
      @user = User.new(name: 'Marcelo')

      expect(@user).to_not be_valid
    end
  
  end  
end
