require('minitest/autorun')
require('minitest/rg')
require_relative('../models/owner')
require_relative('../models/animal')



class OwnerTest < MiniTest::Test

  def setup
    @owner1 = Owner.new({"name" => "Jake", "age" => "26"})
    @animal1 = Animal.new({
      'name' => 'Archie',
      "age" => 11,
      "species" => "Dog",
      "breed" => "Tibetan Terrier",
      "sex" => "Male",
      "admission_date" => '1992-04-19'})
  end

  def test_owner_has_name
    expected = "Jake"
    actual = @owner1.name
    assert_equal(expected, actual)
  end

  def test_adopt_an_animal
    @owner1.adopt_an_animal(@animal1)
    expected = "Archie"
    actual =
  end

end
