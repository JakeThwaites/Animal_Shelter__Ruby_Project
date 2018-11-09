require_relative('../db/sql_runner')

class Owner

  attr_reader :name, :age, :id

  def initialize(options)
    @name = options['name']
    @age = options['age']
    @id = options['id'] if options['id']
  end

  def save()
    sql = "INSERT INTO owners (name, age) VALUES ($1, $2) RETURNING id"
    values = [@name, @age]
    owner = SqlRunner.run(sql, values)
    @id = owner.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners"
    SqlRunner.run(sql)
  end
end
