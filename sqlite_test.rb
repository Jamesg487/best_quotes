require "sqlite3"
require "rulers/sqlite_model"
require "debug"

class MyTable < Rulers::Model::SQLite; end
STDERR.puts MyTable.schema.inspect

# debugger
# Create row
mt = MyTable.create "title" => "I saw it again!"
debugger
mt.title = "I really did!"
mt.title = "I really did!"
mt.save!

mt2 = MyTable.find mt.id

puts "Title: #{mt2.title}"