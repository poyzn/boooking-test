# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create name: 'Test User 1', email: 'test1@example.com', password: 'test1pass'
User.create name: 'Test User 2', email: 'test2@example.com', password: 'test2pass'
