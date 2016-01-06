json.array!(@wbs) do |wb|
  json.extract! wb, :id, :name, :parent_id, :beschreibung, :start, :end, :rb_id, :worker_id
  json.url wb_url(wb, format: :json)
end
