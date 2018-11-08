require('minitest/autorun')
require('minitest/rg')
require_relative('../animal')



class AnimalTest < MiniTest::Test

  def setup
    @animal1 = Animal.new({'name' => 'Archie', "age" => 11, "species" => "Dog", "breed" => "Tibetan Terrier", "sex" => "Male"})
  end

  def test_animal_has_name
    expected = "Archie"
    actual = @animal1.name
    assert_equal(expected, actual)
  end

end
