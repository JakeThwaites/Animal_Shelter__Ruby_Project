class Animal

  attr_reader :name

  def initialize(options)
    @name = options[:name]
    @age = options[:age]
    @species = options[:species]
    @breed = options[:breed]
    @sex = options[:sex]
  end

end
