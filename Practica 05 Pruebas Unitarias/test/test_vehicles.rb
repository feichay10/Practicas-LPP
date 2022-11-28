require 'test/unit'
require 'lib/vehicles_operations'

class Test_Vehicles < Test::Unit::TestCase
  def test_totalPriceVehicles
    assert_equal(350, totalPriceVehicles(7, 50))
    assert_equal(105, totalPriceVehicles(3, 35))
    assert_equal(520, totalPriceVehicles(8, 65))
  end

  def test_vehicleDiscount
    assert_equal(297.5,vehicleDiscount(7,50,0.15))
    assert_equal(84,vehicleDiscount(3,35,0.2))
    assert_equal(364,vehicleDiscount(8,65,0.30))
  end

  def test_kilometersTravelled
    assert_equal(50,kilometersTravelled(100,150))
    assert_equal(110,kilometersTravelled(560,670))
    assert_equal(300,kilometersTravelled(1200, 1500))
  end
end
