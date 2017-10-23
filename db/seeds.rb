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
                  admin: false,
                  last_name: 'Hidalgo',
                  email: 'jhidalgo1@uc.cl',
                  password: 'topsecret',
                  studies: 'estudiante ingenieria industrial en computación',
                  bio: 'vacio')


user2 = User.create(username: 'Manuel Wulf',
                    name: 'Manuel',
                    admin: true,
                    last_name: 'Wulf',
                    email: 'mwulf@mail.com',
                    password: 'topsecret',
                    studies: 'Administrador del sistema',
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
wr = WorkRole.create(name: 'Pedro Perez',  role: 'jefe de grupo', follows_methodologies_id: fm1.id)
wr = WorkRole.create(name: 'Sofia Correa', role: 'ayudante jefe', follows_methodologies_id: fm1.id)

rs = Resource.create(item: 'Guia de estudio', available: true, acquisition: 'ya adquerido', follows_methodologies_id: fm1.id)
rs = Resource.create(item: 'Libros historia de Roma', available: false, acquisition: 'se espera que el colegio coopere en la compra del producto', follows_methodologies_id: fm1.id)
rs = Resource.create(item: 'Entradas al museo', available: false, acquisition: 'se espera que el colegio coopere en la compra del producto', follows_methodologies_id: fm1.id)

cn = Condition.create(item: 'Permisos para salir del colegio', info: 'Enviar solicitud a los padres para que permitan la escurcion al museo', follows_methodologies_id: fm1.id )
cn = Condition.create(item: 'Fijar una fecha', info: 'Encontrar el mejor dia con la secretaria docente, en el que puedan salir toda la jornada', follows_methodologies_id: fm1.id )

br = Broadcast.create(moment_of_implementation: 'Antes',audience: 'Alumnos', diffusion_channel: 'Comunicacion', objective: 'Informar de la salida al museo',follows_methodologies_id: fm1.id )
br = Broadcast.create(moment_of_implementation: 'Durante',audience: 'Alumnos', diffusion_channel: 'Guia de trabajo', objective: 'Entregar y presentar el proyecto',follows_methodologies_id: fm1.id )
br = Broadcast.create(moment_of_implementation: 'Despues',audience: 'Alumnos', diffusion_channel: 'Auto Evaluacion', objective: 'Que evaluen su propio desempeño y el proyecto',follows_methodologies_id: fm1.id )

plan = Planning.create(
                  initiative_name: 'Proyectos entretenidos',
                  objective: 'Poner en practica las materias y aprendizajes del curso',
                  place: 'colegio Nazaret, curso 8°B',
                  start_date:  Date.new(2017,10,25),
                  finish_date: Date.new(2017,11,30),
                  follows_methodologies_id: fm1.id
                  )
bn = Binnacle.create(
                  start_date:   Date.new(2017,10,23),
                  finish_date:  Date.new(2017,10,23),
                  objectives:  'Presentar metodologia',
                  observations:  'Los alumnos se comportaron muy bien en las presentaciones, parecian interesados.....',
                  advances:  'Las cosas han ido bien, destacamos que......',
                  obstacles:  'Un grupo pequeño no puede unirse a la salida al museo por indicacion de sus padres, hay que ver como solucionar esto.',
                  ideas:  'Pedirles a los alumnos que lleven camara, ademas podemos hacer algun tipo de juego en la salida al museo.',
                  follows_methodologies_id:  fm1.id,
                  )

eva = Evaluation.create(
                  follows_methodologies_id: fm1.id,
                  comments_connect: 'Opinion de la primera etapa de ver y conocer las metodologias disponibles',
                  comments_select:  'Opinion de la segunda etapa de elegir metodologia',
                  comments_planning: 'Opinion de la 3° etapa de planificar todo el proceso',
                  comments_implementation: 'Opinion  de la 4° etapa de la implementacion, que mejorar, que funciono...',
                  users_reflection: 'Reflecciones de los usuarios de la innovacion, ordenar sus ideas aca.',
                  users_suggestions: 'Sugerencias de los usuarios de la innovacion'
                  )
rep = Report.create(
                  follows_methodologies_id: fm1.id,
                  comment: 'Esta es la etapa 6 de comunicar, agrgando un comentario final de la opinion y el desarrollo de la metodologia.'
                  )
