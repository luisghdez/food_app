require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Seeds' do
    it 'should have seeded data from the API' do
      expect(Category.count).to be >= 13
    end
  end
end
