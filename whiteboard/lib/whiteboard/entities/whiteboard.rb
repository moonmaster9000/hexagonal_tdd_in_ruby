class Whiteboard
  attr_reader :name
  attr_accessor :id

  def initialize(name:)
    @name = name
  end
end
