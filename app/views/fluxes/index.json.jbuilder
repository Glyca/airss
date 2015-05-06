json.array!(@fluxes) do |flux|
  json.extract! flux, :id, :url, :title
  json.url flux_url(flux, format: :json)
end
