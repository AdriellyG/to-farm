require 'test_helper'

class CargosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cargo = cargos(:one)
  end

  test "should get index" do
    get cargos_url, as: :json
    assert_response :success
  end

  test "should create cargo" do
    assert_difference('Cargo.count') do
      post cargos_url, params: { cargo: { descricao: @cargo.descricao, nome: @cargo.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show cargo" do
    get cargo_url(@cargo), as: :json
    assert_response :success
  end

  test "should update cargo" do
    patch cargo_url(@cargo), params: { cargo: { descricao: @cargo.descricao, nome: @cargo.nome } }, as: :json
    assert_response 200
  end

  test "should destroy cargo" do
    assert_difference('Cargo.count', -1) do
      delete cargo_url(@cargo), as: :json
    end

    assert_response 204
  end
end
