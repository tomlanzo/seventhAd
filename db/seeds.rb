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

Answer.delete_all
Question.delete_all
Player.delete_all
GameSession.delete_all
Seance.delete_all
Game.delete_all
Company.delete_all
Cinema.delete_all
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
      password: 'password',
      photo_url: 'http://res.cloudinary.com/dif8cynwh/image/upload/v1513336980/j5ext4z7ohu6prwksgk3.jpg'
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
       offset_end: 60,
     })

  # create players no email
  players_attr = rand(0..40).times.map do
    {
      game_session: g,
      token: SecureRandom.uuid,
    }
  end
  Player.create!(players_attr)

  # create players with email
  players_attr = rand(40..100).times.map do
    {
      game_session: g,
      token: SecureRandom.uuid,
      name: Faker::Name.first_name,
      email: Faker::Internet.email("emailwithfaker"),
    }
   end
   Player.create!(players_attr)
end

#create questions
questions = Question.create!([
    { game: game1,
      position: '1',
      title: 'qui joue le rôle de han solo dans "solo: a star wars story"?',
      answer_1: 'mark hamill',
      answer_2: 'alden ehrenheich',
      answer_3: 'woody harrelson',
      answer_4: 'harrison ford',
      correct_answer: 2,
      duration: 3000,

    },

    { game: game1,
      position: '2',
      title: "quel est le nom du vaisseau mythique de han solo?",
      answer_1: 'le at-at',
      answer_2: 'le tie fighter',
      answer_3: 'le faucon millenium',
      answer_4: 'le x-wing',
      correct_answer: 3,
      duration: 18,
    },
    { game: game1,
      position: '3',
      title: "l'ami de han solo, chewbacca, est un ... ?",
      answer_1: 'wookiee',
      answer_2: 'ewok',
      answer_3: 'pork',
      answer_4: 'gungan',
      correct_answer: 1,
      duration: 18,
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
       start_at: 30.seconds.from_now,
       movie: "Demo day batch #89",
     })

   GameSession.create! (
    {  id: 5,
       company: company1,
       game: game1,
       seance: seance32,
       offset_end: 60,
       short_url: 'http://7thad.eu/demo'
     })

 puts "#{Cinema.count} cinemas created"
 puts "#{Company.count} companies created"
 puts "#{Seance.count} seances created"
 puts "#{Game.count} games created"
 puts "#{Question.count} questions created"
 puts "#{GameSession.count} game sessions created"
 puts "#{Player.count} players created"
 puts "Seeds duration: #{(Time.now - start_time).to_i} seconds"
