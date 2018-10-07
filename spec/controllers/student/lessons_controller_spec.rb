require 'rails_helper'

RSpec.describe Student::LessonsController, type: :controller do
  let(:params_hash) { attributes_for(:lesson) }

  before do
    create(:student)
  end

  before(:each) do
    params_hash["start_time(1i)"] = 2018
    params_hash["start_time(2i)"] = 10
    params_hash["start_time(3i)"] = 11
    params_hash["start_time(4i)"] = 19
    params_hash["start_time(5i)"] = 00
    params_hash["end_time(1i)"] = 2018
    params_hash["end_time(2i)"] = 10
    params_hash["end_time(3i)"] = 11
    params_hash["end_time(4i)"] = 19
    params_hash["end_time(5i)"] = 15
  end

  describe '#create' do
    it 'should redirect to tutors#index when succeed' do
      post :create, params: { lesson: params_hash }
      expect(response).to redirect_to(tutors_url)
    end

    it 'should render new when time is invalid' do
      params_hash["start_time(4i)"] = 20
      post :create, params: { lesson: params_hash }
      expect(response).to render_template('new')
    end
  end
end
