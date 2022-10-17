# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#50.times do |i|
#    Task.create!(title: "task#{i+1}", content:"content#{i+1}")
# end

Task.create(title: "task#{6}", content:"content#{6}", deadline_on: Date.new, priority: 0, status: 2, user_id: 1)
Task.create(title: "task#{9}", content:"content#{9}", deadline_on: Date.new, priority: 2, status: 1, user_id: 15)
Task.create(title: "task#{8}", content:"content#{8}", deadline_on: Date.new, priority: 1, status: 2, user_id: 17)
