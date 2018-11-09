require('minitest/autorun')
require('minitest/rg')
require_relative('../models/owner')



class OwnerTest < MiniTest::Test

  def setup
    @owner1 = Owner.new({"name" => "Jake", "age" => "26"})
  end

  def test_owner_has_name
    expected = "Jake"
    actual = @owner1.name
    assert_equal(expected, actual)
  end
  
end
