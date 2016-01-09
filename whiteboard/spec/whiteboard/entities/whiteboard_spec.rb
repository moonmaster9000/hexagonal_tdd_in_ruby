require "whiteboard/entities/whiteboard"

describe "whiteboard" do
  describe "equality" do
    context "when the id is nil" do
      it "does not equal any other whiteboard" do
        nil_whiteboard_1 = Whiteboard.new(id: nil)
        nil_whiteboard_2 = Whiteboard.new(id: nil)
        whiteboard_with_id = Whiteboard.new(id: 1)

        expect(nil_whiteboard_1).not_to eq(nil_whiteboard_2)
        expect(nil_whiteboard_1).not_to eq(whiteboard_with_id)
      end
    end

    context "when the id is not nil" do
      it "equals another whiteboard with the same id" do
        whiteboard_a = Whiteboard.new(id: "A")
        whiteboard_b = Whiteboard.new(id: "B")

        expect(whiteboard_a).to eq(Whiteboard.new(id: whiteboard_a.id))
        expect(whiteboard_a).not_to eq(whiteboard_b)
      end
    end
  end
end
