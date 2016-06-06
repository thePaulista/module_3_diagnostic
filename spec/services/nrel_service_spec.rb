require 'rails_helper'

describe 'Nrel Service' do
  it 'it fetches the closest station by specific input' do
    VCR.use_cassette("nrel service#get_location") do
      service = NrelService.new

      stations = service.get_location(zip: "80203", distance: "6 miles", fuel_type_code: "ELEC.LPG")
      station = stations.last

      expect(stations.count).to eq 2
      expect(station[:station_name]).to eq "CADACHARGEPOINT"
      expect(station[:street_address]).to eq "290 E Speer Blvd"
      expect(station[:city]).to eq "Denver"
      expect(station[:state]).to eq "CO"
      expect(station[:access_days_time]).to eq "24 hours daily"
    end
  end
end
