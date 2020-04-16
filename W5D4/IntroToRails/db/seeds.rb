# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
House.destroy_all
p "Creating Houses"
house1 = House.create(address: "Mother Base, Seychelles")
house2 = House.create(address: "Guy Heaven")

Person.destroy_all
p "Creating People"
person1 = Person.create(name: "Big Boss", house_id: house1.id)
person2 = Person.create(name: "Kazuhira Miller", house_id: house1.id)
person3 = Person.create(name: "Revolver Ocelot", house_id: house1.id)
person4 = Person.create(name: "Peanut Arbuckle", house_id: house2.id)
person5 = Person.create(name: "Pink Dress", house_id: house2.id)
person6 = Person.create(name: "Gogo Nuts", house_id: house2.id)