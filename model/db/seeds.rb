# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


for i in 1..3
    Book.create([
        {isbn:"000-#{i}-2222-3333-4", name: '레일즈 모델', price: 1000*i, publish:"멋사단국대 - '#{i}'"},
        {isbn:"555-#{i}-2222-3333-4", name: '레일즈 모델', price: 500*i, publish:"멋사단국대 - '#{i}'"}
        ])
end 

