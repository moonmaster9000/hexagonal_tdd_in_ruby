class FakeWhiteboardRepo
  def initialize
    @whiteboards = []
  end

  def save(whiteboard)
    require "securerandom"
    whiteboard.id = SecureRandom.uuid
    @whiteboards << whiteboard
  end

  def find_by_name(name)
    @whiteboards.find { |w| w.name == name }
  end
end
