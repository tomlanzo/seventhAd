# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cinemas = [
   { name: 'Multiplexe Le Palace',
     address: 'ZAC des Plaines de Figuerolles, 13500 Martigues'
    },
    { name: 'Le Renoir',
     address: '24 Cours Mirabeu, 13100, Aix en Provence'
    },
    { name: 'Le Prado',
     address: '36 Avenue du Prado, 13006 Marseille'
    },
  ]

companies = [
    { name: 'Haribo',
      email: 'contact@haribo.com'
    },
    { name: 'Gran Frais',
      email: 'contact@granfrais.com'
    },
    { name: 'Starbucks',
      email: 'contact@starbucks.com'
    },
  ]

games = [
    { name: 'Le jeux des ours',
      kind: 'Quizz'
    },
    { name: 'Cuisinon ensemble',
      kind: 'Quizz'
    },
    { name: 'Le jeux des cafes',
      kind: 'Quizz'
    },
  ]

 questions = [
    { position: '1',
      title: '',
      answer_1: '',
      answer_2: '',
      answer_3: '',
      answer_4: '',
      correct_answer: '',
      duration: '',


    },


  ]
