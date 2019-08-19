require 'test_helper'

class FazendaHasPlanosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fazenda_has_plano = fazenda_has_planos(:one)
  end

  test "should get index" do
    get fazenda_has_planos_url, as: :json
    assert_response :success
  end

  test "should create fazenda_has_plano" do
    assert_difference('FazendaHasPlano.count') do
      post fazenda_has_planos_url, params: { fazenda_has_plano: { ativo: @fazenda_has_plano.ativo, dt_inicio: @fazenda_has_plano.dt_inicio, fazenda_id: @fazenda_has_plano.fazenda_id } }, as: :json
    end

    assert_response 201
  end

  test "should show fazenda_has_plano" do
    get fazenda_has_plano_url(@fazenda_has_plano), as: :json
    assert_response :success
  end

  test "should update fazenda_has_plano" do
    patch fazenda_has_plano_url(@fazenda_has_plano), params: { fazenda_has_plano: { ativo: @fazenda_has_plano.ativo, dt_inicio: @fazenda_has_plano.dt_inicio, fazenda_id: @fazenda_has_plano.fazenda_id } }, as: :json
    assert_response 200
  end

  test "should destroy fazenda_has_plano" do
    assert_difference('FazendaHasPlano.count', -1) do
      delete fazenda_has_plano_url(@fazenda_has_plano), as: :json
    end

    assert_response 204
  end
end
