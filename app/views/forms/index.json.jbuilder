json.array!(@forms) do |form|
  json.extract! form, :id, :opt, :pes, :real, :worker_id, :round_id
  json.url form_url(form, format: :json)
end
