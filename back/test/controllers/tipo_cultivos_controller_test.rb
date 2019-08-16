require 'test_helper'

class TipoCultivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_cultivo = tipo_cultivos(:one)
  end

  test "should get index" do
    get tipo_cultivos_url, as: :json
    assert_response :success
  end

  test "should create tipo_cultivo" do
    assert_difference('TipoCultivo.count') do
      post tipo_cultivos_url, params: { tipo_cultivo: { nome: @tipo_cultivo.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show tipo_cultivo" do
    get tipo_cultivo_url(@tipo_cultivo), as: :json
    assert_response :success
  end

  test "should update tipo_cultivo" do
    patch tipo_cultivo_url(@tipo_cultivo), params: { tipo_cultivo: { nome: @tipo_cultivo.nome } }, as: :json
    assert_response 200
  end

  test "should destroy tipo_cultivo" do
    assert_difference('TipoCultivo.count', -1) do
      delete tipo_cultivo_url(@tipo_cultivo), as: :json
    end

    assert_response 204
  end
end
