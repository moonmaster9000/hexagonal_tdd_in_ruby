require "whiteboard"

def whiteboard_repo_contract(repo_class)
  describe "whiteboard repo" do
    let(:ny) { Whiteboard.new(name: "NY") }
    let(:sf) { Whiteboard.new(name: "SF") }
    let(:repo) { repo_class.new }

    before do
      repo.save(ny)
      repo.save(sf)
    end

    it "creates unique IDs for whiteboards when saved" do
      expect(ny.id).to be
      expect(sf.id).to be
      expect(ny.id).not_to eq(sf.id)
    end

    it "finds by name" do
      expect(repo.find_by_name(ny.name)).to eq ny
      expect(repo.find_by_name(sf.name)).to eq sf
    end
  end
end


describe "create whiteboard" do
  # save the whiteboard     ==> Persistence

  it "requires name" do
    create_whiteboard(name: "", gui: gui, repo: repo)

    expect(gui.spy_validation_errors).to include(name: :required)
  end

  it "requires names be unique" do
    create_whiteboard(name: "valid name", gui: gui, repo: repo)
    create_whiteboard(name: "valid name", gui: gui, repo: repo)

    expect(gui.spy_validation_errors).to include(name: :unique)
  end

  it "send an id for the created whiteboard back to the gui" do
    create_whiteboard(name: "valid name", gui: gui, repo: repo)

    expect(gui.spy_created_whiteboard_id).to be
  end

  let(:gui) { GuiSpy.new }
  let(:repo) { FakeWhiteboardRepo.new }

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

  whiteboard_repo_contract(FakeWhiteboardRepo)


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
