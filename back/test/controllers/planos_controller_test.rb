require 'test_helper'

class PlanosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plano = planos(:one)
  end

  test "should get index" do
    get planos_url, as: :json
    assert_response :success
  end

  test "should create plano" do
    assert_difference('Plano.count') do
      post planos_url, params: { plano: { nome: @plano.nome, valor: @plano.valor } }, as: :json
    end

    assert_response 201
  end

  test "should show plano" do
    get plano_url(@plano), as: :json
    assert_response :success
  end

  test "should update plano" do
    patch plano_url(@plano), params: { plano: { nome: @plano.nome, valor: @plano.valor } }, as: :json
    assert_response 200
  end

  test "should destroy plano" do
    assert_difference('Plano.count', -1) do
      delete plano_url(@plano), as: :json
    end

    assert_response 204
  end
end
