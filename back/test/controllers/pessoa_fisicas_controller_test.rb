require 'test_helper'

class PessoaFisicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pessoa_fisica = pessoa_fisicas(:one)
  end

  test "should get index" do
    get pessoa_fisicas_url, as: :json
    assert_response :success
  end

  test "should create pessoa_fisica" do
    assert_difference('PessoaFisica.count') do
      post pessoa_fisicas_url, params: { pessoa_fisica: { cpf: @pessoa_fisica.cpf, pessoa_id: @pessoa_fisica.pessoa_id } }, as: :json
    end

    assert_response 201
  end

  test "should show pessoa_fisica" do
    get pessoa_fisica_url(@pessoa_fisica), as: :json
    assert_response :success
  end

  test "should update pessoa_fisica" do
    patch pessoa_fisica_url(@pessoa_fisica), params: { pessoa_fisica: { cpf: @pessoa_fisica.cpf, pessoa_id: @pessoa_fisica.pessoa_id } }, as: :json
    assert_response 200
  end

  test "should destroy pessoa_fisica" do
    assert_difference('PessoaFisica.count', -1) do
      delete pessoa_fisica_url(@pessoa_fisica), as: :json
    end

    assert_response 204
  end
end
