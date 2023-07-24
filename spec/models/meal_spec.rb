require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe 'Seeds' do
    it 'should have seeded data from the API' do
      expect(Meal.count).to be >= 293
    end
  end
end
