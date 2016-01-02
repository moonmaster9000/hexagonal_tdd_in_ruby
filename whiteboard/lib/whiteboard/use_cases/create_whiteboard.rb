require "whiteboard/entities/whiteboard"

def create_whiteboard(name:, gui:, repo:)
  if name.empty?
    gui.validation_failed([{field: :name, validation: :required}])
  elsif repo.find_by_name(name)
    gui.validation_failed([{field: :name, validation: :unique}])
  else
    whiteboard = Whiteboard.new(name: name)
    repo.save(whiteboard)
    gui.whiteboard_created(whiteboard.id)
  end
end
