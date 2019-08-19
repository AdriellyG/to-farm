require 'test_helper'

class TipoSolosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_solo = tipo_solos(:one)
  end

  test "should get index" do
    get tipo_solos_url, as: :json
    assert_response :success
  end

  test "should create tipo_solo" do
    assert_difference('TipoSolo.count') do
      post tipo_solos_url, params: { tipo_solo: { acidez: @tipo_solo.acidez, nome: @tipo_solo.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show tipo_solo" do
    get tipo_solo_url(@tipo_solo), as: :json
    assert_response :success
  end

  test "should update tipo_solo" do
    patch tipo_solo_url(@tipo_solo), params: { tipo_solo: { acidez: @tipo_solo.acidez, nome: @tipo_solo.nome } }, as: :json
    assert_response 200
  end

  test "should destroy tipo_solo" do
    assert_difference('TipoSolo.count', -1) do
      delete tipo_solo_url(@tipo_solo), as: :json
    end

    assert_response 204
  end
end
