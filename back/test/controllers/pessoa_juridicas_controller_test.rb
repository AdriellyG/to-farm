require 'test_helper'

class PessoaJuridicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pessoa_juridica = pessoa_juridicas(:one)
  end

  test "should get index" do
    get pessoa_juridicas_url, as: :json
    assert_response :success
  end

  test "should create pessoa_juridica" do
    assert_difference('PessoaJuridica.count') do
      post pessoa_juridicas_url, params: { pessoa_juridica: { cnpj: @pessoa_juridica.cnpj, pessoa_id: @pessoa_juridica.pessoa_id } }, as: :json
    end

    assert_response 201
  end

  test "should show pessoa_juridica" do
    get pessoa_juridica_url(@pessoa_juridica), as: :json
    assert_response :success
  end

  test "should update pessoa_juridica" do
    patch pessoa_juridica_url(@pessoa_juridica), params: { pessoa_juridica: { cnpj: @pessoa_juridica.cnpj, pessoa_id: @pessoa_juridica.pessoa_id } }, as: :json
    assert_response 200
  end

  test "should destroy pessoa_juridica" do
    assert_difference('PessoaJuridica.count', -1) do
      delete pessoa_juridica_url(@pessoa_juridica), as: :json
    end

    assert_response 204
  end
end
