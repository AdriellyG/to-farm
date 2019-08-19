require 'test_helper'

class CultivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cultivo = cultivos(:one)
  end

  test "should get index" do
    get cultivos_url, as: :json
    assert_response :success
  end

  test "should create cultivo" do
    assert_difference('Cultivo.count') do
      post cultivos_url, params: { cultivo: { fazendas_id: @cultivo.fazendas_id, nome: @cultivo.nome, tipo_cultivos_id: @cultivo.tipo_cultivos_id } }, as: :json
    end

    assert_response 201
  end

  test "should show cultivo" do
    get cultivo_url(@cultivo), as: :json
    assert_response :success
  end

  test "should update cultivo" do
    patch cultivo_url(@cultivo), params: { cultivo: { fazendas_id: @cultivo.fazendas_id, nome: @cultivo.nome, tipo_cultivos_id: @cultivo.tipo_cultivos_id } }, as: :json
    assert_response 200
  end

  test "should destroy cultivo" do
    assert_difference('Cultivo.count', -1) do
      delete cultivo_url(@cultivo), as: :json
    end

    assert_response 204
  end
end
