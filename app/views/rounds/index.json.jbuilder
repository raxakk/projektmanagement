json.array!(@rounds) do |round|
  json.extract! round, :id, :count, :member_number
  json.url round_url(round, format: :json)
end
