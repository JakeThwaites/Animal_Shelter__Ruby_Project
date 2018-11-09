require_relative('../db/sql_runner')

class Adoption

  attr_reader :animal_id, :owner_id, :adoption_date, :id

  def initialize(options)
    @animal_id = options["animal_id"]
    @owner_id = options["owner_id"]
    @adoption_date = options["adoption_date"]
    @id = options["id"] if options["id"]
  end

  def save()
    sql = "INSERT INTO adoptions (animal_id, owner_id, adoption_date) VALUES ($1, $2, $3) RETURNING id;"
    values = [@animal_id, @owner_id, @adoption_date]
    adoption = SqlRunner.run(sql, values)
    @id = adoption.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM adoptions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql values)
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE adoptions SET (animal_id, owner_id, adoption_date) = ($1, $2, $3) WHERE id = $4"
    values = [@animal_id, @owner_id, @adoption_date, @id]
    SqlRunner.run(sql, values)
  end

end
