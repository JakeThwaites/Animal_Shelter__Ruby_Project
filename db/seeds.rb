require_relative( "../models/animal" )
require_relative("../models/owner")
require_relative("../models/adoption")


Adoption.delete_all()
Animal.delete_all()
Owner.delete_all()

animal1 = Animal.new({
  'name' => 'Archie',
  "age" => 11,
  "species" => "Dog",
  "breed" => "Tibetan Terrier",
  "sex" => "Male",
  "admission_date" => '1992-04-19',
  "availability" => "available",
  "pet_description" => "Archie is a very good boy",
  "image_url" => "https://i.pinimg.com/236x/5c/88/a7/5c88a782d938fa8db4b18c4a4e696545--summer-haircuts-tibetan-terrier.jpg"})

animal1.save()

animal2 = Animal.new({
    'name' => 'Walter',
    "age" => 4,
    "species" => "Dog",
    "breed" => "King Charles Spaniel",
    "sex" => "Male",
    "admission_date" => '2012-12-20',
    "availability" => "available",
    "pet_description" => "Walter is a very good boy",
    "image_url" => "https://cbslocal-uploads.storage.googleapis.com/captures/DAE/7D2/DAE7D20C4B6741D89435FCEC5B69A9EA.jpg" })

animal2.save()

animal3 = Animal.new({
    'name' => 'Jimbo',
    "age" => 10,
    "species" => "Cat",
    "breed" => "black",
    "sex" => "Male",
    "admission_date" => '2012-12-05',
    "availability" => "available",
    "image_url" => "https://www.thehappycatsite.com/wp-content/uploads/2017/09/black-and-white2.jpg" })

animal3.save()


owner1 = Owner.new({"name" => "Jake", "age" => 26, "contact_number" => "0123456789", "address_1" => "123 Fake Street", "address_2" => "Someplace far away", "city" => "Edinburgh", "post_code" => "EH11 1ED"})
owner1.save()

owner2 = Owner.new({"name" => "Chris", "age" => 30, "contact_number" => "0123434624", "address_1" => "1 Princes Street", "city" => "Edinburgh", "post_code" => "EH1 1DD"})
owner2.save()

owner3 = Owner.new({"name" => "Rob", "age" => 23, "contact_number" => "01234796524", "address_1" => "Street name", "address_2" => "Place", "city" => "Berlin", "post_code" => "germany"})
owner3.save()


owner1.adopt_an_animal(animal1, '2008-09-01')
owner2.adopt_an_animal(animal2, '2008-09-01')


nil
