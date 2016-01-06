json.array!(@pbs) do |pb|
  json.extract! pb, :id, :name, :parent_id, :beschreibung
  json.url pb_url(pb, format: :json)
end
