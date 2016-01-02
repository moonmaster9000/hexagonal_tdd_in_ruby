require "whiteboard"
require "support/fake_whiteboard_repo"

describe "create whiteboard" do
  it "requires name" do
    create_whiteboard(name: "", gui: gui, repo: repo)

    expect(gui.spy_validation_errors).to include(field: :name, validation: :required)
  end

  it "requires names be unique" do
    create_whiteboard(name: "valid name", gui: gui, repo: repo)
    create_whiteboard(name: "valid name", gui: gui, repo: repo)

    expect(gui.spy_validation_errors).to include(field: :name, validation: :unique)
  end

  it "send an id for the created whiteboard back to the gui" do
    create_whiteboard(name: "valid name", gui: gui, repo: repo)

    expect(gui.spy_created_whiteboard_id).to be
  end

  let(:gui) { GuiSpy.new }
  let(:repo) { FakeWhiteboardRepo.new }

  class GuiSpy
    def validation_failed(errors)
      @spy_validation_errors = errors
    end

    attr_reader :spy_validation_errors

    def whiteboard_created(id)
      @spy_created_whiteboard_id = id
    end

    attr_reader :spy_created_whiteboard_id
  end
end
