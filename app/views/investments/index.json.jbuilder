json.array!(@investments) do |investment|
  json.extract! investment, :id, :title, :size, :description, :type, :revenue_share, :start_date, :end_date, :company_id, :industry, :stage, :location, :expected_return
  json.url investment_url(investment, format: :json)
end
