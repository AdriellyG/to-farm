require 'test_helper'

class TipoMovimentacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_movimentacao = tipo_movimentacaos(:one)
  end

  test "should get index" do
    get tipo_movimentacaos_url, as: :json
    assert_response :success
  end

  test "should create tipo_movimentacao" do
    assert_difference('TipoMovimentacao.count') do
      post tipo_movimentacaos_url, params: { tipo_movimentacao: { descricao: @tipo_movimentacao.descricao, nome: @tipo_movimentacao.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show tipo_movimentacao" do
    get tipo_movimentacao_url(@tipo_movimentacao), as: :json
    assert_response :success
  end

  test "should update tipo_movimentacao" do
    patch tipo_movimentacao_url(@tipo_movimentacao), params: { tipo_movimentacao: { descricao: @tipo_movimentacao.descricao, nome: @tipo_movimentacao.nome } }, as: :json
    assert_response 200
  end

  test "should destroy tipo_movimentacao" do
    assert_difference('TipoMovimentacao.count', -1) do
      delete tipo_movimentacao_url(@tipo_movimentacao), as: :json
    end

    assert_response 204
  end
end
