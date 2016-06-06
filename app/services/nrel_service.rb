class NrelService
  def initialize
    @conn = Faraday.new(url: "https://developer.nrel.gov")
    conn.params[:api_key] = ENV["api_key"]
  end

  def get_location(params)
    require "pry"; binding.pry
    parse(conn.get("/api/alt-fuel-stations/v1.json", params))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end

  def conn
    @conn
  end
end
