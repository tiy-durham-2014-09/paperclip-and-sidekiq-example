require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  context "GET :index" do
    setup { get :index }

    should respond_with(:ok)
    should render_template(:index)
  end
end
