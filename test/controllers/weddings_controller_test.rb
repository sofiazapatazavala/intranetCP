require 'test_helper'

class WeddingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wedding = weddings(:one)
  end

  test "should get index" do
    get weddings_url
    assert_response :success
  end

  test "should get new" do
    get new_wedding_url
    assert_response :success
  end

  test "should create wedding" do
    assert_difference('Wedding.count') do
      post weddings_url, params: { wedding: { celular: @wedding.celular, comentarios: @wedding.comentarios, created_at: @wedding.created_at, fecha_matri: @wedding.fecha_matri, mail: @wedding.mail, nombre1: @wedding.nombre1, nombre2: @wedding.nombre2, origen: @wedding.origen, updated_at: @wedding.updated_at, url_vals: @wedding.url_vals } }
    end

    assert_redirected_to wedding_url(Wedding.last)
  end

  test "should show wedding" do
    get wedding_url(@wedding)
    assert_response :success
  end

  test "should get edit" do
    get edit_wedding_url(@wedding)
    assert_response :success
  end

  test "should update wedding" do
    patch wedding_url(@wedding), params: { wedding: { celular: @wedding.celular, comentarios: @wedding.comentarios, created_at: @wedding.created_at, fecha_matri: @wedding.fecha_matri, mail: @wedding.mail, nombre1: @wedding.nombre1, nombre2: @wedding.nombre2, origen: @wedding.origen, updated_at: @wedding.updated_at, url_vals: @wedding.url_vals } }
    assert_redirected_to wedding_url(@wedding)
  end

  test "should destroy wedding" do
    assert_difference('Wedding.count', -1) do
      delete wedding_url(@wedding)
    end

    assert_redirected_to weddings_url
  end
end
