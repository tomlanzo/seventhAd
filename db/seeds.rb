# This file should contain all the recor d creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all
Player.destroy_all
GameSession.destroy_all
Seance.destroy_all
Game.destroy_all
Company.destroy_all
Cinema.destroy_all

#create cinemas
cinema1 = Cinema.create!(
    { name: 'Le Wagon',
     address: '167 Rue Paradis, 13006 Marseille '
    })

Cinema.all.each do |cinema|
   Seance.create!(
     { cinema: cinema,
       room: "Space de coworking",
       start_at: "20:30".to_datetime,
       movie: "Demo day batch #89",
     })
  end

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
   GameSession.create! (
     { company: Company.all.sample,
       game: game1,
       seance: seance,
       duration: 60
     })
end

#create questions
 questions = Question.create!([
    { game: game1,
      position: '1',
      title: "Quelle est la couleur principale du logo 'Le Wagon'?",
      answer_1: 'A. Jaune, comme le soleil',
      answer_2: 'B. Rouge, comme le coeur',
      answer_3: "C. Vert, comme l'espoir",
      answer_4: "D. Les couleurs de l'arc en ciel",
      correct_answer: 2,
      duration: 15,
    },
    { game: game1,
      position: '2',
      title: 'Depuis quand Le Wagon est à Marseille?',
      answer_1: 'A. Bah, ça fais que 3 mois',
      answer_2: 'B. Depuis 1999',
      answer_3: 'C. Je dirais 2015',
      answer_4: 'D. Avant hier',
      correct_answer: 3,
      duration: 15,
    },
    { game: game1,
      position: '3',
      title: 'Combien ça dure la formation au Wagon?',
      answer_1: 'A. 9 semaines!',
      answer_2: 'B. 5 mois',
      answer_3: 'C. Trois ans et demi',
      answer_4: 'D. Sais pas, 2 jours?',
      correct_answer: 1,
      duration: 15,
    },
  ])

 puts "#{Cinema.count} cinemas created"
 puts "#{Company.count} companies created"
 puts "#{Seance.count} seances created"
 puts "#{Game.count} games created"
 puts "#{Question.count} questions created"
 puts "#{GameSession.count} game sessions created"
