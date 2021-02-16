# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserDetail.delete_all
UserDetail.create(name: 'Himanshu', username: 'Maanu1080', wins: 1034, losses: 100, current_tokens: 100)
UserDetail.create(name: 'Fake', username: 'Fake', wins: 10, losses: 10, current_tokens: 1050)
UserDetail.create(name: 'Fake2', username: 'Fake2', wins: 104, losses: 109, current_tokens: 10)
UserDetail.create(name: 'Fake3', username: 'Fake3', wins: 103, losses: 14, current_tokens: 1050)