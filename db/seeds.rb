# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Article.create :title => "Louis is a jenius", :text => "Louis was recently declared an utter genius after his iq score was 10000 times Marylon vos Savant's", :publish_date => DateTime.now - 1.week
