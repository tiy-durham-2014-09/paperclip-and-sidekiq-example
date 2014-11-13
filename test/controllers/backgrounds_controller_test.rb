require 'test_helper'

class BackgroundsControllerTest < ActionController::TestCase
  context "GET :index" do
    setup { get :index }

    should respond_with(:ok)
    should render_template(:index)
  end

  context "GET :show" do
    setup do
      @background = create(:background)
      get :show, id: @background
    end

    should respond_with(:ok)
    should render_template(:show)
  end

  context "GET :new" do
    setup { get :new }

    should respond_with(:ok)
    should render_template(:new)
  end

  context "POST :create" do
    context "with valid params" do
      setup do
        params = { background: { title: "a background",
                                 image: fixture_file_upload('files/cool-dude.jpg', 'image/jpeg') } }
        post :create, params
      end

      should "create a new background" do
        background = assigns[:background]
        assert_not_nil background
        assert background.persisted?
      end

      should "redirect to new background" do
        assert_redirected_to assigns[:background]
      end
    end

    context "with invalid params" do
      setup do
        post :create, background: { title: "" }
      end

      should render_template(:new)
    end
  end
end
