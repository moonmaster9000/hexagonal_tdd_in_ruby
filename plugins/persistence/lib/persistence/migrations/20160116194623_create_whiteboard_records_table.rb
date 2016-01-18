class CreateWhiteboardRecordsTable < ActiveRecord::Migration
  def change
    create_table :whiteboard_records do |t|
      t.string :name
    end
  end
end
