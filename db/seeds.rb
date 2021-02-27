# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

races = Race.create([
  { 
    name: "London Marathon 2019", 
    date: Date.iso8601("2019-04-28") 
  },
  {
    name: "Brighton Half Marathon 2019",
    date: Date.iso8601("2019-02-24")
  },
  {
    name: "New Forest Half Marathon 2019",
    date: Date.iso8601("2019-08-09")
  },
  {
    name: "Tough Mudder 2019",
    date: Date.iso8601("2019-07-28")
  }
])

runners = Runner.create([
  {
    name: "Michael Mouse",
    email: "mickey@disney.com"
  },
  {
    name: "Minnestrone Mouse",
    email: "minnie@disney.com"
  }
])

orders = Order.create([
  {
    name: "Michael",
    date: Date.iso8601("2019-04-28"),
    time: "3:51",
    runner_id: runners.first.id,
    race_id: races.first.id,
    completed: false
  },
  {
    name: "Minnie",
    date: Date.iso8601("2019-04-28"),
    time: "4:32",
    runner_id: runners.last.id,
    race_id: races.first.id,
    completed: false
  },
])