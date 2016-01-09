class Whiteboard
  attr_reader :name
  attr_accessor :id

  def initialize(name: nil, id: nil)
    @name = name
    @id = id
  end

  def ==(other_whiteboard)
    !id.nil? && id == other_whiteboard.id
  end
end
