require 'test_helper'

class LocalFisicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @local_fisico = local_fisicos(:one)
  end

  test "should get index" do
    get local_fisicos_url, as: :json
    assert_response :success
  end

  test "should create local_fisico" do
    assert_difference('LocalFisico.count') do
      post local_fisicos_url, params: { local_fisico: { descricao: @local_fisico.descricao, fazendas_id: @local_fisico.fazendas_id, nome: @local_fisico.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show local_fisico" do
    get local_fisico_url(@local_fisico), as: :json
    assert_response :success
  end

  test "should update local_fisico" do
    patch local_fisico_url(@local_fisico), params: { local_fisico: { descricao: @local_fisico.descricao, fazendas_id: @local_fisico.fazendas_id, nome: @local_fisico.nome } }, as: :json
    assert_response 200
  end

  test "should destroy local_fisico" do
    assert_difference('LocalFisico.count', -1) do
      delete local_fisico_url(@local_fisico), as: :json
    end

    assert_response 204
  end
end
