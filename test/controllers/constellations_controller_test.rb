require "test_helper"

class ConstellationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @constellation = constellations(:one)
  end

  test "should get index" do
    get constellations_url, as: :json
    assert_response :success
  end

  test "should create constellation" do
    assert_difference("Constellation.count") do
      post constellations_url, params: { constellation: { abbreviation: @constellation.abbreviation, adjective: @constellation.adjective, name: @constellation.name } }, as: :json
    end

    assert_response :created
  end

  test "should show constellation" do
    get constellation_url(@constellation), as: :json
    assert_response :success
  end

  test "should get constellation stars" do
    get constellation_stars_url(@constellation), as: :json
    assert_response :success
  end

  test "should update constellation" do
    patch constellation_url(@constellation), params: { constellation: { abbreviation: @constellation.abbreviation, adjective: @constellation.adjective, name: @constellation.name } }, as: :json
    assert_response :success
  end

  test "should destroy constellation" do
    assert_difference("Constellation.count", -1) do
      delete constellation_url(@constellation), as: :json
    end

    assert_response :no_content
  end
end
