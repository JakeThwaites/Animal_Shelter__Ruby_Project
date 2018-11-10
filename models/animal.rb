require_relative('../db/sql_runner')

class Animal

  attr_reader :age, :species, :breed, :sex, :id, :admission_date, :pet_description
  attr_accessor :name, :availability

  def initialize(options)
    @name = options["name"]
    @age = options["age"]
    @species = options["species"]
    @breed = options["breed"]
    @sex = options["sex"]
    @admission_date = options["admission_date"]
    @availability = options["availability"]
    @pet_description = options["pet_description"] if options["pet_description"]
    @id = options["id"] if options["id"]
  end

  def self.all()
    sql = "SELECT * FROM animals"
    values = []
    result = SqlRunner.run(sql, values)
    return result.map { |animal| Animal.new(animal) }
  end

  def self.find_by_species(species)
    sql = "SELECT * FROM animals WHERE species = $1"
    values = [species]
    animals = SqlRunner.run(sql, values)
    return animals.map { |animal| Animal.new(animal) }
  end

  def self.find_by_breed(breed)
    sql = "SELECT * FROM animals WHERE species = $1"
    values = [breed]
    animals = SqlRunner.run(sql, values)
    return animals.map { |animal| Animal.new(animal) }
  end

  def self.all_species
    unique_specieses = []
    all_animals = self.all()
    for animal in all_animals
      unique_specieses.push(animal.species)
    end
    return unique_specieses.uniq
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO animals (name, age, species, breed, sex, admission_date, availability, pet_description) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING ID"
    values = [@name, @age, @species, @breed, @sex, @admission_date, @availability, @pet_description]
    animal = SqlRunner.run(sql, values)
    @id = animal.first()['id'].to_i
  end

  def update()
    sql = "UPDATE animals SET (name, age, species, breed, sex, admission_date, availability, pet_description) = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9"
    values = [@name, @age, @species, @breed, @sex, @admission_date, @availability, @pet_description, @id, ]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def owner()
    sql = "SELECT owners.* FROM owners INNER JOIN adoptions ON owners.id = adoptions.owner_id WHERE adoptions.animal_id = $1;"
    values = [@id]
    owners = SqlRunner.run(sql, values)
    return owners.map { |owner| Owner.new(owner) }
  end

  def add_pet_description(text)
    @pet_description = text
    update()
  end

  def self.find_animal_by_id(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    animal = Animal.new(result)
    return animal
  end

end
