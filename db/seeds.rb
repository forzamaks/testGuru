# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create([
  {title: 'Frontend'},
  {title: 'Backend'},
  {title: 'Mobile Development'},
  {title: 'Machine learning'}
])

Test.create([
  {title: 'HTML', level: 1, category_id: 1},
  {title: 'Ruby', level: 2, category_id: 2},
  {title: 'JavaScript', level: 2, category_id: 1},
  {title: 'GO', level: 3, category_id: 3},
  {title: 'Node', level: 2, category_id:  2}
])

Question.create([
  {body: 'Что такое HTML?', test_id: 1},
  {body: 'Какие основные виды списков применяют при создании веб-страницы?', test_id: 1},
  {body: 'Что такое прототип объекта?', test_id: 3},
  {body: 'Перечислите некоторые особенности Ruby?', test_id: 2},
  {body: 'Как создать объект Ruby?', test_id: 2}
])

Answer.create([
  {title: 'Вариант 1', question_id: 1},
  {title: 'Вариант 2', question_id: 1},
  {title: 'Вариант 3', correct: true, question_id: 1},
  {title: 'Вариант 4', question_id: 1}
])

User.create([
  {name: 'test', email: 'test@test.test', password: 'password', tests: [1, 2, 3]},
  {name: 'admin', email: 'admin@test.test', password: 'admin_pass'},
])