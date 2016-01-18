require "persistence"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "test.db")
ActiveRecord::Migrator.up(File.join(__dir__, "..", "lib", "persistence", "migrations"))

RSpec.configure do |c|
  c.before do
    Persistence::WhiteboardRecord.delete_all
  end
end
