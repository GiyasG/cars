json.extract! company, :id, :name, :description, :contactname, :street, :city, :postcode, :country, :phone, :email, :homepage, :created_at, :updated_at
json.url company_url(company, format: :json)
