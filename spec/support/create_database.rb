require "active_record"

ActiveRecord::Base.configurations = { "test" => { adapter: "sqlite3", database: ":memory:" } }
ActiveRecord::Base.establish_connection :test

class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:musics) do |t|
      t.string :title
      t.integer :genre
    end
  end
end

ActiveRecord::Migration.verbose = false
CreateAllTables.up
