json.array!(@suitcases) do |suitcase|
  json.extract! suitcase, :id, :name, :days, :gender
  json.url suitcase_url(suitcase, format: :json)
end
