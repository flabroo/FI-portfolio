# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"
require "json"

puts '*** Cleaning up languages/projects ***'
puts ''
Project.destroy_all
Language.destroy_all

puts '*** Seeding database with languages ***'
puts ''

Language.create(
  name: "Ruby on Rails"
)

Language.create(
  name: "Ruby"
)

Language.create(
  name: "SQL"
)

Language.create(
  name: "Javascript"
)

Language.create(
  name: "Stimulus"
)

Language.create(
  name: "HTML"
)

Language.create(
  name: "CSS"
)

puts '*** Seeding database with projects ***'
puts ''

filepath = "db/projects.csv"

CSV.foreach(filepath, headers: :first_row) do |row|
  project = Project.create(
    name: row['name'],
    role: row['role'],
    kind: row['type'],
    url: row['url'],
    summary: row['summary'],
    purpose: row['purpose'],
    explanation: row['explanation'],
    problems: row['problems']
  )
  JSON.parse(row['stack']).each do |language_id|
    stack = Stack.new
    stack.project = project
    stack.language = Language.find(language_id)
    stack.save!
  end
end

puts 'Done!'
