require_relative('../db/sql_runner')
require_relative('animal')
require_relative('adoption')


class Owner

  attr_reader :name, :age, :id, :contact_number, :address_1, :address_2, :city, :post_code

  def initialize(options)
    @name = options['name'].capitalize
    @age = options['age']
    @contact_number = options['contact_number']
    @address_1 = options['address_1']
    @address_2 = options['address_2'] if options['address_2']
    @city = options['city'].capitalize if options['city']
    @post_code = options['post_code']
    @id = options['id'] if options['id']
  end

  def self.all()
    sql = "SELECT * FROM owners"
    result = SqlRunner.run(sql)
    return result.map { |owner| Owner.new(owner) }
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO owners (name, age, contact_number, address_1, address_2, city, post_code) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id"
    values = [@name, @age, @contact_number, @address_1, @address_2, @city, @post_code]
    owner = SqlRunner.run(sql, values)
    @id = owner.first()['id'].to_i
  end

  def update()
    sql = "UPDATE owners SET (name, age, contact_number, address_1, address_2, city, post_code) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
    values = [@name, @age, @contact_number, @address_1, @address_2, @city, @post_code, @id]
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

  def adopted_animals__names()
    sql = "SELECT animals.* FROM animals INNER JOIN adoptions ON animals.id = adoptions.animal_id WHERE adoptions.owner_id = $1"
    values = [@id]
    animals = SqlRunner.run(sql, values)
    name = animals.first()['name'].to_s
    return name
  end

  def adopted_animals__id()
    sql = "SELECT animals.* FROM animals INNER JOIN adoptions ON animals.id = adoptions.animal_id WHERE adoptions.owner_id = $1"
    values = [@id]
    animals = SqlRunner.run(sql, values)
    id = animals.first()['id'].to_i
    return id
  end

  def adopt_an_animal(animal, date)
    adoption = Adoption.new({"owner_id" => @id, "animal_id" => animal.id, "adoption_date" => date})
    adoption.save()
    animal.availability = "Adopted"
    animal.update()
  end

  def self.find_owner_by_id(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    owner = Owner.new(result)
    return owner
  end
end
