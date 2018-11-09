require_relative( "../models/animal" )
require_relative("../models/owner")
require("pry-byebug")

Animal.delete_all()

animal1 = Animal.new({
  'name' => 'Archie',
  "age" => 11,
  "species" => "Dog",
  "breed" => "Tibetan Terrier",
  "sex" => "Male",
  "admission_date" => '1992-04-19'})

animal1.save()

animal2 = Animal.new({
    'name' => 'Walter',
    "age" => 4,
    "species" => "Dog",
    "breed" => "King Charles Spaniel",
    "sex" => "Male",
    "admission_date" => '2012/12/20' })

animal2.save()

# animal1.name = "Bob"
# animal1.update()
# animal2.delete()


owner1 = Owner.new({"name" => "Jake", "age" => "26"})
owner1.save()

binding.pry
nil
