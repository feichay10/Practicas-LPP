require 'owners'

describe Owners do
  it "Se instancia un propietario" do
    expect(Owners.new(666666666, "Cheuk")).not_to eq(nil)
  end
end