require_relative('../db/sql_runner')
require_relative('animal')
require_relative('adoption')


class Owner

  attr_reader :name, :age, :id

  def initialize(options)
    @name = options['name']
    @age = options['age']
    @id = options['id'] if options['id']
  end

  def self.all()
    sql = "SELECT * FROM owners"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO owners (name, age) VALUES ($1, $2) RETURNING id"
    values = [@name, @age]
    owner = SqlRunner.run(sql, values)
    @id = owner.first()['id'].to_i
  end

  def update()
    sql = "UPDATE owners SET (name, age) = ($1, $2) WHERE id = $3"
    values = [@name, @age, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def adopted_animals()
    sql = "SELECT animals.* FROM animals INNER JOIN adoptions ON animals.id = adoptions.animal_id WHERE adoptions.owner_id = $1"
    values = [@id]
    animals = SqlRunner.run(sql, values)
    return animals.map { |animal| Animal.new(animal) }
  end

  def adopt_an_animal(animal, date)
    adoption = Adoption.new({"owner_id" => @id, "animal_id" => animal.id, "adoption_date" => date})
    adoption.save()
    animal.availability = "Adopted"
    animal.update()
  end
end
