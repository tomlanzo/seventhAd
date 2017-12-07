# This file should contain all the recor d creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all
GameSession.destroy_all
Seance.destroy_all
Game.destroy_all
Company.destroy_all
Cinema.destroy_all

#create cinemas
cinema1 = Cinema.create!(
    { name: 'Multiplexe Le Palace',
     address: 'ZAC des Plaines de Figuerolles, 13500 Martigues'
    })
cinema2 = Cinema.create!(
    { name: 'Le Renoir',
     address: '24 Cours Mirabeu, 13100, Aix en Provence'
    })
cinema3 = Cinema.create!(
    { name: 'Le Prado',
     address: '36 Avenue du Prado, 13006 Marseille'
    })

Cinema.all.each do |cinema|
   Seance.create!([
     { cinema: cinema,
       room: "Le mistral",
       start_at: "20:30".to_datetime,
       movie: "12 jours",
     },
     { cinema: cinema,
       room: "Les calanques",
       start_at: "19:30".to_datetime,
       movie: "Coco",
     },
    ])
  end

#create companies

company1 = Company.create!(
    { name: 'Haribo',
      email: 'contact@haribo.com',
      password: 'password'
    })
company2 = Company.create!(
    { name: 'Gran Frais',
      email: 'contact@granfrais.com',
      password: 'password'
    })
company3 = Company.create!(
    { name: 'Starbucks',
      email: 'contact@starbucks.com',
      password: 'password'
    })

#create games
game1 = Game.create!({
    name: 'Le jeux des ours',
    kind: 'Quizz'
    })
game2 = Game.create!(
    { name: 'Cuisinon ensemble',
      kind: 'Quizz'
    })
game3 = Game.create!(
    { name: 'Le jeux des cafes',
      kind: 'Quizz'
    })

Seance.all.each do |seance|
   GameSession.create! ([
     { company: Company.all.sample,
       game: game1,
       seance: seance,
       duration: 60
     },
     { company: Company.all.sample,
       game: game1,
       seance: seance,
       duration: 60
     },
     { company: Company.all.sample,
       game: game1,
       seance: seance,
       duration: 60
     },
  ])
end

#create questions
 questions = Question.create!([
    { game: game1,
      position: '1',
      title: "What is the shape of haribo's most famous candy?",
      answer_1: 'Dog',
      answer_2: 'Bear',
      answer_3: 'Elephant',
      answer_4: 'Rainbow',
      correct_answer: 2,
      duration: 15,
    },
    { game: game1,
      position: '2',
      title: 'How many gummy bear flavors exist?',
      answer_1: '17',
      answer_2: '3',
      answer_3: '5',
      answer_4: '4',
      correct_answer: 3,
      duration: 15,
    },
    { game: game1,
      position: '3',
      title: 'Which of the following is NOT a haribo bear flavor?',
      answer_1: 'Orange',
      answer_2: 'Strawberry',
      answer_3: 'Raspberry',
      answer_4: 'Coke',
      correct_answer: 4,
      duration: 15,
    },
  ])

 puts "#{Cinema.count} cinemas created"
 puts "#{Company.count} companies created"
 puts "#{Seance.count} seances created"
 puts "#{Game.count} games created"
 puts "#{Question.count} questions created"
 puts "#{GameSession.count} game sessions created"
