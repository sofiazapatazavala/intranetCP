json.extract! course, :id, :nombre, :estilo, :edades, :created_at, :updated_at
json.url course_url(course, format: :json)