json.extract! photo, :id, :file, :description, :created_at, :updated_at
json.url photo_url(photo, format: :json)
