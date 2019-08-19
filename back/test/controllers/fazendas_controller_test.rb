require 'test_helper'

class FazendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fazenda = fazendas(:one)
  end

  test "should get index" do
    get fazendas_url, as: :json
    assert_response :success
  end

  test "should create fazenda" do
    assert_difference('Fazenda.count') do
      post fazendas_url, params: { fazenda: { cep: @fazenda.cep, cidade: @fazenda.cidade, estado: @fazenda.estado, nome: @fazenda.nome, numero: @fazenda.numero, pessoa_id: @fazenda.pessoa_id, rua: @fazenda.rua } }, as: :json
    end

    assert_response 201
  end

  test "should show fazenda" do
    get fazenda_url(@fazenda), as: :json
    assert_response :success
  end

  test "should update fazenda" do
    patch fazenda_url(@fazenda), params: { fazenda: { cep: @fazenda.cep, cidade: @fazenda.cidade, estado: @fazenda.estado, nome: @fazenda.nome, numero: @fazenda.numero, pessoa_id: @fazenda.pessoa_id, rua: @fazenda.rua } }, as: :json
    assert_response 200
  end

  test "should destroy fazenda" do
    assert_difference('Fazenda.count', -1) do
      delete fazenda_url(@fazenda), as: :json
    end

    assert_response 204
  end
end
