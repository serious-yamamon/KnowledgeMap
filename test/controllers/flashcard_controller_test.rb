require 'test_helper'

class FlashcardControllerTest < ActionDispatch::IntegrationTest
  test "should get select" do
    get flashcard_select_url
    assert_response :success
  end

end
