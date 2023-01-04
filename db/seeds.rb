# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

puts '*** Cleaning up projects ***'
puts ''
Project.destroy_all

puts '*** Seeding database with projects ***'
puts ''

filepath = "db/projects.csv"

CSV.foreach(filepath, headers: :first_row) do |row|
  Project.create(
    name: row['name'],
    role: row['role'],
    kind: row['type'],
    url: row['url'],
    summary: row['summary'],
    purpose: row['purpose'],
    explanation: row['explanation'],
    problems: row['problems']
  )
end

puts 'Done!'
