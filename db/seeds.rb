# This file should contain all the recor d creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seance.last.update(start_at: x.seconds.from_now);

start_time = Time.now

puts "Starting at #{start_time}"

Answer.destroy_all
Question.destroy_all
Player.destroy_all
GameSession.destroy_all
Seance.destroy_all
Game.destroy_all
Company.destroy_all
Cinema.destroy_all
Sidekiq::Queue.new.clear

 puts "#{Cinema.count} cinemas"
 puts "#{Company.count} companies"
 puts "#{Seance.count} seances"
 puts "#{Game.count} games"
 puts "#{Question.count} questions"
 puts "#{GameSession.count} game sessions"
 puts "#{Player.count} players"




#create cinemas
cinema1 = Cinema.create!(
    { name: 'Le Prado',
     address: '36 Avenue du Prado, 13006 Marseille'
    })
cinema2 = Cinema.create!(
    { name: 'Les Variétés',
     address: '37 rue Vincent-Scotto, 13001 Marseille'
    })

 seance11 =  Seance.create!(
     { cinema: cinema1,
       room: "Salle 12",
       start_at: "10/12/2017 19:15".to_datetime.in_time_zone,
       movie: "La Villa",
     }),

 seance12 =  Seance.create!(
     { cinema: cinema1,
       room: "Salle 7",
       start_at: "09/12/2017 16:30".to_datetime.in_time_zone,
       movie: "Stars 80 : la suite",
     }),
 seance21 =  Seance.create!(
     { cinema: cinema2,
       room: "Salle 3",
       start_at: "08/12/2017 18:15".to_datetime.in_time_zone,
       movie: "Bienvenue à Suburbicon",
     })
 seance22 =  Seance.create!(
     { cinema: cinema2,
       room: "Salle 6",
       start_at: "06/12/2017 21:45".to_datetime.in_time_zone,
       movie: "Les Bienheureux",
     })

#create companies

company1 = Company.create!(
    { name: 'Le Wagon',
      email: 'contact@lewagon.com',
      password: 'password'
    })
#create games
game1 = Game.create!({
    name: 'Connaisez vous Le Wagon? ',
    kind: 'Quizz'
    })

Seance.all.each do |seance|
# create seance
   g = GameSession.create! (
     { company: company1,
       game: game1,
       seance: seance,
       offset_start: 10,
       offset_end: 45,
     })
# create players no email
   rand(100).times do
     Player.create! ( {
        game_session: g,
        token: rand(200000000000000),
      })
   end
 #create players with email
   rand(100).times do
     Player.create! ( {
        game_session: g,
        token: rand(200000000000000),
        name:Faker::Name.first_name,
        email: Faker::Internet.email,
      })
   end
end

#create questions
questions = Question.create!([
    { game: game1,
      position: '1',
      title: "Dans quelle ville a été fondé le Wagon",
      answer_1: 'A. Londres',
      answer_2: 'B. Paris',
      answer_3: 'C. Montluçon',
      answer_4: 'D. Lyon',
      correct_answer: 2,
      duration: 10,
    },
    { game: game1,
      position: '2',
      title: 'Depuis quand Le Wagon est à Marseille?',
      answer_1: 'A. 3 mois',
      answer_2: 'B. 1999',
      answer_3: 'C. 2015',
      answer_4: 'D. Avant-hier',
      correct_answer: 3,
      duration: 10,
    },
    { game: game1,
      position: '3',
      title: 'Combien dure la formation fullstack du Wagon?',
      answer_1: 'A. 9 semaines',
      answer_2: 'B. 5 mois',
      answer_3: 'C. 1 an',
      answer_4: 'D. 15 jours',
      correct_answer: 1,
      duration: 10,
    },
  ])

# Le Wagon - Game Session pour tests et gamesession pour DD, no players, no answers
cinema3 = Cinema.create!(
    { name: 'Le Wagon',
     address: '167 Rue Paradis, 13006 Marseille'
    })

 seance32 =  Seance.create!(
     { cinema: cinema3,
       room: "Space de coworking",
       start_at: 10.seconds.from_now,
       movie: "Demo day batch #89",
     })

   GameSession.create! (
    {  id: 5,
       company: company1,
       game: game1,
       seance: seance32,
       offset_start: 10,
       offset_end: 45,
       short_url: 'http://vu.fr/ad'
     })

 puts "#{Cinema.count} cinemas created"
 puts "#{Company.count} companies created"
 puts "#{Seance.count} seances created"
 puts "#{Game.count} games created"
 puts "#{Question.count} questions created"
 puts "#{GameSession.count} game sessions created"
 puts "#{Player.count} players created"
 puts "Seeds duration: #{(Time.now - start_time).to_i} seconds"
