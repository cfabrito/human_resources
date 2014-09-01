# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_girl_rails'

Person.create(first_name: "Brady", last_name: "Bogisich", phone_number: "078747184", email: "ulices@lueilwitzfritsch.org", birth_date: "1951-04-25",linkedin_url: "http://linkedin.com/derick")
Person.create(first_name: "Mustafa", last_name: "Bahringer", phone_number: "782425361", email: "roscoe@koelpin.name", birth_date: "1967-10-27",linkedin_url: "http://linkedin.com/emmalee_kuvalis")
Person.create(first_name: "Kayleigh", last_name: "O'Connell", phone_number: "455057357", email: "seth.krajcik@deckow.name", birth_date: "1970-11-23",linkedin_url: "http://linkedin.com/lorine")
Person.create(first_name: "Ike", last_name: "Huels", phone_number: "852425735", email: "alanna.dietrich@glover.name", birth_date: "1958-09-02",linkedin_url: "http://linkedin.com/annamarie.runolfon")
Person.create(first_name: "Jewell", last_name: "Rosenbaum", phone_number: "243271037", email: "caterina.gaylord@weinat.net", birth_date: "1971-08-26",linkedin_url: "http://linkedin.com/everett.zulauf")
Person.create(first_name: "Fausto", last_name: "Greenholt", phone_number: "315709922", email: "dillan@ankunding.org", birth_date: "1973-10-20",linkedin_url: "http://linkedin.com/deron")
Person.create(first_name: "Angela", last_name: "Spencer", phone_number: "645396928", email: "deshawn_cruickshank@bahringermedhurst.info", birth_date: "1972-07-01",linkedin_url: "http://linkedin.com/graciela")
Person.create(first_name: "Margarete", last_name: "Hackett", phone_number: "026213321", email: "betsy_greenfelder@kulasabernathy.org", birth_date: "1991-08-13",linkedin_url: "http://linkedin.com/mitchell_vonrueden")
Person.create(first_name: "Dameon", last_name: "McCullough", phone_number: "275383601", email: "kaylee@raynor.name", birth_date: "1988-08-22",linkedin_url: "http://linkedin.com/mikel")
Person.create(first_name: "Green", last_name: "Kassulke", phone_number: "024472324", email: "dana@bruenjacobi.biz", birth_date: "1982-10-31",linkedin_url: "http://linkedin.com/deshaun_bradtke")

Team.create(team_name: "Mills-Torphy")
Team.create(team_name: "Huel-Gibson")
Team.create(team_name: "Schneider LLC")
Team.create(team_name: "Keebler-Spencer")
Team.create(team_name: "Dietrich Group")
