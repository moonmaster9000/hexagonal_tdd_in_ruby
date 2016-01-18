module Persistence
  class WhiteboardRepo
    def save(whiteboard)
      record = WhiteboardRecord.new(name: whiteboard.name)
      record.save!
      whiteboard.id = record.id
    end

    def find_by_name(name)
      record = WhiteboardRecord.find_by_name(name)

      if record
        Whiteboard.new(name: name, id: record.id)
      else
        nil
      end
    end
  end
end
