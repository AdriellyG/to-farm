require 'test_helper'

class PlantiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plantio = plantios(:one)
  end

  test "should get index" do
    get plantios_url, as: :json
    assert_response :success
  end

  test "should create plantio" do
    assert_difference('Plantio.count') do
      post plantios_url, params: { plantio: { areas_id: @plantio.areas_id, cultivos_id: @plantio.cultivos_id, dt_final: @plantio.dt_final, dt_inicial: @plantio.dt_inicial, fazendas_id: @plantio.fazendas_id, status_plantios_id: @plantio.status_plantios_id } }, as: :json
    end

    assert_response 201
  end

  test "should show plantio" do
    get plantio_url(@plantio), as: :json
    assert_response :success
  end

  test "should update plantio" do
    patch plantio_url(@plantio), params: { plantio: { areas_id: @plantio.areas_id, cultivos_id: @plantio.cultivos_id, dt_final: @plantio.dt_final, dt_inicial: @plantio.dt_inicial, fazendas_id: @plantio.fazendas_id, status_plantios_id: @plantio.status_plantios_id } }, as: :json
    assert_response 200
  end

  test "should destroy plantio" do
    assert_difference('Plantio.count', -1) do
      delete plantio_url(@plantio), as: :json
    end

    assert_response 204
  end
end
