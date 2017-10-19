# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




##### USERS #####
user1 = User.create(username: 'Jose Hidalgo',
                  name: 'Josefina',
                  last_name: 'Hidalgo',
                  email: 'jhidalgo1@uc.cl',
                  password: 'topsecret',
                  studies: 'estudiante ingenieria industrial en computación',
                  bio: 'vacio')
user1.save

##### methodologies #####
met1 = Methodology.create(title: 'Aprendizaje Basado en Proyectos (ABP)',
                  description: 'El Aprendizaje Basado en Proyectos permite a los alumnos adquirir conocimientos y competencias a través de la elaboración de proyectos que den respuesta a problemas de la vida real. Al partir de un problema concreto y real, esta metodología garantiza procesos de aprendizaje más didácticos, eficaces y prácticos y permite al estudiante desarrollar competencias complejas como el pensamiento crítico, la comunicación, la colaboración y la resolución de problemas.',
                  link_video: 'https://www.youtube.com/watch?v=-pD43AuUo80',
                  category: 'Educación',
                  organization: 'Pontificia Universidad Católica de Chile')

met2 = Methodology.create(title: 'Flipped Classroom (Aula Invertida)',
                  description: 'En este modelo pedagógico, los elementos tradicionales de la lección impartida por el profesor se invierten. Los materiales educativos son estudiados por los alumnos en casa y, luego, se trabajan en el aula. El objetivo: optimizar el tiempo en clase para dedicarlo a atender las necesidades especiales de cada alumno y al desarrollo de proyectos cooperativos.',
                  link_video: 'https://www.youtube.com/watch?v=ePOnn0H9GMY',
                  category: 'Educación',
                  organization: 'Pontificia Universidad Católica de Chile')

met2 = Methodology.create(title: 'Gamificación',
                  description: 'Se trata de la integración de mecánicas y dinámicas de juego y videojuegos en entornos no lúdicos, con el fin de potenciar la motivación, la concentración, el esfuerzo, la fidelización y otros valores positivos comunes a todos los juegos. La integración de dinámicas de juego en dichos entornos no es un fenómeno nuevo, pero el crecimiento exponencial del uso de videojuegos en los últimos años ha despertado el interés de muchos expertos del ámbito educativo.',
                  link_video: 'https://www.youtube.com/watch?v=1yW6voYxNrA',
                  category: 'Educación',
                  organization: 'Pontificia Universidad Católica de Chile')


#### Folows Methodology ######

fm1 = FollowsMethodology.create(
                  user_id: user1.id,
                  methodology_id: met1.id
                  )
