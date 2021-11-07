require 'rails_helper'

RSpec.describe Tank, :type => :model do
  let (:a_tank){FactoryBot.create(:tank)}
  it "A tanks can be alone, without belonging to a route" do
    expect(a_tank.route).to be_nil
  end
  it "A tanks can belongs to a route" do
    a_tank.route = FactoryBot.create(:route)
    expect(a_tank.route).not_to be_nil
  end
end
