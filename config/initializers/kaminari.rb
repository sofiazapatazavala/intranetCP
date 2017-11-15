# config/initializers/kaminari.rb
# PARA QUE FUNCIONE CON WILL_PAGINATE
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end
