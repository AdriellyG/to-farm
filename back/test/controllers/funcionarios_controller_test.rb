require 'test_helper'

class FuncionariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funcionario = funcionarios(:one)
  end

  test "should get index" do
    get funcionarios_url, as: :json
    assert_response :success
  end

  test "should create funcionario" do
    assert_difference('Funcionario.count') do
      post funcionarios_url, params: { funcionario: { cargos_id: @funcionario.cargos_id, usuarios_id: @funcionario.usuarios_id } }, as: :json
    end

    assert_response 201
  end

  test "should show funcionario" do
    get funcionario_url(@funcionario), as: :json
    assert_response :success
  end

  test "should update funcionario" do
    patch funcionario_url(@funcionario), params: { funcionario: { cargos_id: @funcionario.cargos_id, usuarios_id: @funcionario.usuarios_id } }, as: :json
    assert_response 200
  end

  test "should destroy funcionario" do
    assert_difference('Funcionario.count', -1) do
      delete funcionario_url(@funcionario), as: :json
    end

    assert_response 204
  end
end
