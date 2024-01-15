json.extract! lesson, :id, :title, :description, :paid, :course_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
