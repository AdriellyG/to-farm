require 'test_helper'

class StatusPlantiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_plantio = status_plantios(:one)
  end

  test "should get index" do
    get status_plantios_url, as: :json
    assert_response :success
  end

  test "should create status_plantio" do
    assert_difference('StatusPlantio.count') do
      post status_plantios_url, params: { status_plantio: { descricao: @status_plantio.descricao } }, as: :json
    end

    assert_response 201
  end

  test "should show status_plantio" do
    get status_plantio_url(@status_plantio), as: :json
    assert_response :success
  end

  test "should update status_plantio" do
    patch status_plantio_url(@status_plantio), params: { status_plantio: { descricao: @status_plantio.descricao } }, as: :json
    assert_response 200
  end

  test "should destroy status_plantio" do
    assert_difference('StatusPlantio.count', -1) do
      delete status_plantio_url(@status_plantio), as: :json
    end

    assert_response 204
  end
end
