require 'rails_helper'

describe StaticPagesController, type: :controller do
  describe '#index' do
    it "render with proper template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
