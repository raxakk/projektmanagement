json.array!(@rbs) do |rb|
  json.extract! rb, :id, :name, :parent_id, :qualifikation, :erfahrung
  json.url rb_url(rb, format: :json)
end
