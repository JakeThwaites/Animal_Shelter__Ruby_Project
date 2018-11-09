require_relative( "../models/animal" )
require_relative("../models/owner")
require_relative("../models/adoption")
require("pry-byebug")

Animal.delete_all()
Owner.delete_all()

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


owner1 = Owner.new({"name" => "Jake", "age" => 26})
owner1.save()

owner2 = Owner.new({"name" => "Chris", "age" => 30})
owner2.save()



adoption1 = Adoption.new({"animal_id" => animal1.id, "owner_id" => owner1.id, "adoption_date" => '2008-09-01'})
adoption1.save()

adoption2 = Adoption.new({"animal_id" => animal2.id, "owner_id" => owner2.id, "adoption_date" => '2008-09-01'})
adoption2.save()


binding.pry
nil
