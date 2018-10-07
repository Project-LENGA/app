require 'rails_helper'

RSpec.describe Student::LessonsController, type: :controller do
  before(:each) do
    create(:student)
  end

  describe 'render' do
    it 'should render index' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
