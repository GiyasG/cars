json.extract! carpart, :id, :name, :code, :description, :detail, :price, :stock, :reserved, :reservedtime, :paidtime, :sold, :created_at, :updated_at
json.url carpart_url(carpart, format: :json)
