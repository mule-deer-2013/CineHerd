# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "Dan Apczynski", email: "apczynski@gmail.com", password: "dan")
User.create(username: "Luisa Emmi Beck", email: "emmi.beck@gmail.com", password: "luisa")
User.create(username: "Chae O'Keefe", email: "chaeokeefe@gmail.com", password: "chae")
User.create(username: "Lloyd Nimetz", email: "lnimetz@me.com", password: "lloyd")