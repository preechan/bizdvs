json.array!(@certification_categories) do |certification_category|
  json.extract! certification_category, :id, :certificationCategory, :microDiscount
  json.url certification_category_url(certification_category, format: :json)
end
