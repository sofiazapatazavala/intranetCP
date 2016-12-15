json.extract! student, :id, :nombre, :telefono, :email, :comoseenteraron, :descuento, :comentarios, :created_at, :updated_at
json.url student_url(student, format: :json)