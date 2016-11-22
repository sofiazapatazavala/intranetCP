json.extract! lesson, :id, :fecha, :titulo, :notas, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)