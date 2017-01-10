json.extract! archive, :id, :nombre, :email, :telefono, :procedencia, :comentarios, :created_at, :updated_at
json.url archive_url(archive, format: :json)