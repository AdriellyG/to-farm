require 'test_helper'

class AcessoUsuarioFazendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acesso_usuario_fazenda = acesso_usuario_fazendas(:one)
  end

  test "should get index" do
    get acesso_usuario_fazendas_url, as: :json
    assert_response :success
  end

  test "should create acesso_usuario_fazenda" do
    assert_difference('AcessoUsuarioFazenda.count') do
      post acesso_usuario_fazendas_url, params: { acesso_usuario_fazenda: { fazendas_id: @acesso_usuario_fazenda.fazendas_id, usuarios_id: @acesso_usuario_fazenda.usuarios_id } }, as: :json
    end

    assert_response 201
  end

  test "should show acesso_usuario_fazenda" do
    get acesso_usuario_fazenda_url(@acesso_usuario_fazenda), as: :json
    assert_response :success
  end

  test "should update acesso_usuario_fazenda" do
    patch acesso_usuario_fazenda_url(@acesso_usuario_fazenda), params: { acesso_usuario_fazenda: { fazendas_id: @acesso_usuario_fazenda.fazendas_id, usuarios_id: @acesso_usuario_fazenda.usuarios_id } }, as: :json
    assert_response 200
  end

  test "should destroy acesso_usuario_fazenda" do
    assert_difference('AcessoUsuarioFazenda.count', -1) do
      delete acesso_usuario_fazenda_url(@acesso_usuario_fazenda), as: :json
    end

    assert_response 204
  end
end
