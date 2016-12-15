require 'test_helper'

class SpecialClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @special_class = special_classes(:one)
  end

  test "should get index" do
    get special_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_special_class_url
    assert_response :success
  end

  test "should create special_class" do
    assert_difference('SpecialClass.count') do
      post special_classes_url, params: { special_class: { comentarios: @special_class.comentarios, comoseenteraron: @special_class.comoseenteraron, contacto: @special_class.contacto, descuento: @special_class.descuento, email: @special_class.email, nombre1: @special_class.nombre1, nombre2: @special_class.nombre2, nombre3: @special_class.nombre3, nombre4: @special_class.nombre4, nombre5: @special_class.nombre5, nombre6: @special_class.nombre6, telefono: @special_class.telefono } }
    end

    assert_redirected_to special_class_url(SpecialClass.last)
  end

  test "should show special_class" do
    get special_class_url(@special_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_special_class_url(@special_class)
    assert_response :success
  end

  test "should update special_class" do
    patch special_class_url(@special_class), params: { special_class: { comentarios: @special_class.comentarios, comoseenteraron: @special_class.comoseenteraron, contacto: @special_class.contacto, descuento: @special_class.descuento, email: @special_class.email, nombre1: @special_class.nombre1, nombre2: @special_class.nombre2, nombre3: @special_class.nombre3, nombre4: @special_class.nombre4, nombre5: @special_class.nombre5, nombre6: @special_class.nombre6, telefono: @special_class.telefono } }
    assert_redirected_to special_class_url(@special_class)
  end

  test "should destroy special_class" do
    assert_difference('SpecialClass.count', -1) do
      delete special_class_url(@special_class)
    end

    assert_redirected_to special_classes_url
  end
end
