require_relative('../db/sql_runner')

class Adoption

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

end
