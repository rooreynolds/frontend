require_relative "../test_helper"

class SupportControllerTest < ActionController::TestCase
  should "setup a dummy artefact for slimmer" do
    @controller.expects(:set_slimmer_dummy_artefact).with(:section_name => 'Support', :section_link => '/support')
    get :index
  end

  should "set slimmer format of support-pages" do
    get :index
    assert_equal "support-pages",  response.headers["X-Slimmer-Format"]
  end

  should "set correct expiry headers" do
    get :index

    assert_equal "max-age=1800, public",  response.headers["Cache-Control"]
  end

end