require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Create category' do
    it 'Creates a valid category' do
      category = Category.new(name: 'Beach', priority: 1)

      expect(category).to be_valid
    end

    it 'Validates category without name' do
      category = Category.new(priority: 1)

      expect(category).to_not be_valid
    end

    it 'Validates category without priority' do
      category = Category.new(name: 'Beach')

      expect(category).to_not be_valid
    end

    it "Validates category's name length" do
      category = Category.new(name: 'Beach is a place where we have sand, salt water and the ocean',
                               priority: 1)

      expect(category).to_not be_valid
    end
  end
end
