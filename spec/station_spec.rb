require './lib/station.rb'

describe Station do

  let(:station) { Station.new("station_name", "zone") }
  
  it "should expect the station name" do
    #subject.name(station_name)
    expect(station.name).to eq("station_name")
  end
  
  it "should expect the station zone" do
    #subject.zone(zone)
    expect(station.zone).to eq("zone")
  end
end