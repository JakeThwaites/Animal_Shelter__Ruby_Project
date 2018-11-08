require_relative('../db/sql_runner')

class Animal

  attr_reader :name, :age, :species, :breed, :sex, :id

  def initialize(options)
    @name = options["name"]
    @age = options["age"]
    @species = options["species"]
    @breed = options["breed"]
    @sex = options["sex"]
    @admission_date = options["admission_date"]
    @id = options["id"] if options["id"]
  end

  def self.all()
    sql = "SELECT * FROM animals"
    values = []
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO animals (name, age, species, breed, sex, admission_date, availability) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING ID"
    values = [@name, @age, @species, @breed, @sex, @admission_date, @availability]
    animal = SqlRunner.run(sql, values)
    @id = animal.first()['id'].to_i
  end

end
