# README


##APIS

### Get all planning info  of a FollowsMethodology:

URL: GET "follows/:id_follow/plannings"

headers:
  - token: USER TOKEN

body response:
```javascript
{
    "planning": {
        "id": 1,
        "initiative_name": "Proyectos entretenidos",
        "objective": "Poner en practica las materias y aprendizajes del curso",
        "place": "colegio Nazaret, curso 8°B",
        "start_date": "2017-10-25",
        "finish_date": "2017-11-30"
    },
    "work_roles": [
        {
            "id": 1,
            "name": "Pedro Perez",
            "role": "jefe de grupo"
        },
        {
            "id": 2,
            "name": "Sofia Correa",
            "role": "ayudante jefe"
        }
    ],
    "broadcasts": [
        {
            "id": 1,
            "moment_of_implementation": "Antes",
            "audience": "Alumnos",
            "diffusion_channel": "Comunicacion",
            "objective": "Informar de la salida al museo"
        },
        {
            "id": 2,
            "moment_of_implementation": "Durante",
            "audience": "Alumnos",
            "diffusion_channel": "Guia de trabajo",
            "objective": "Entregar y presentar el proyecto"
        },
        {
            "id": 3,
            "moment_of_implementation": "Despues",
            "audience": "Alumnos",
            "diffusion_channel": "Auto Evaluacion",
            "objective": "Que evaluen su propio desempeño y el proyecto"
        }
    ],
    "conditions": [
        {
            "id": 1,
            "item": "Permisos para salir del colegio",
            "info": "Enviar solicitud a los padres para que permitan la escurcion al museo"
        },
        {
            "id": 2,
            "item": "Fijar una fecha",
            "info": "Encontrar el mejor dia con la secretaria docente, en el que puedan salir toda la jornada"
        }
    ],
    "resources": [
        {
            "id": 1,
            "item": "Guia de estudio",
            "available": true,
            "acquisition": "ya adquerido"
        },
        {
            "id": 2,
            "item": "Libros historia de Roma",
            "available": false,
            "acquisition": "se espera que el colegio coopere en la compra del producto"
        },
        {
            "id": 3,
            "item": "Entradas al museo",
            "available": false,
            "acquisition": "se espera que el colegio coopere en la compra del producto"
        }
    ]
}
```

### Delete Planning
URL: DELETE "follows/:id_follow/planning/:id"

headers:
  - token: USER TOKEN

body response:
- status: 200 OK
```javascript
    {"message": "Eliminacion exitosa"}
```

### Create Planning
URL: POST "follows/:id_follow/planning/"

headers:
  - token: USER TOKEN

body request:
```javascript
{
	"initiative_name": "Proyectos!!!",
	"objective": "Lograr hacer proyectos",
	"place": "Curso de diseño",
	"start_date": "2017-10-30",
	"finish_date": "2017-12-30"
}
```

body response:
- status: 200 OK

```javascript
    {
      "message": "Creacion exitosa",
      "idPlanning": 1
    }
```

##WORK ROLES of a FollowsMethodology

### All WorkRoles (INDEX)
URL: GET "follows/:id_follow/work_roles/"

headers:
  - token: USER TOKEN

body response:
- status: 200 OK

```javascript
{
    "work_roles": [
        {
            "id": 1,
            "name": "Pedro Perez",
            "role": "jefe de grupo"
        },
        {
            "id": 2,
            "name": "Sofia Correa",
            "role": "ayudante jefe"
        }
    ]
}
```

### Create WorkRoles
URL: POST "follows/:id_follow/work_role"

headers:
  - token: USER TOKEN

body request:
```javascript
{
	"name": "Pablo Ovalle",
	"role": "Ayudante jefe"
}
```

body response:
- status: 200 OK
```javascript
 {
   "message": "Rol de trabajo creado exitosamente",
   "idWorkRole": rol.id
 }
```
### destroy WorkRoles
URL: DELETE "follows/:id_follow/work_role/:id"

headers:
  - token: USER TOKEN



body response:
- status: 200 OK
```javascript
 {
   "message": "Rol de trabajo eliminado exitosamente"
 }
```
##Conditions of a FollowsMethodology

### All Conditions (INDEX)
URL: GET "follows/:id_follow/condition/"

headers:
  - token: USER TOKEN

body response:
- status: 200 OK

```javascript
{
    "conditions": [
        {
            "id": 1,
            "item": "Permisos para salir del colegio",
            "info": "Enviar solicitud a los padres para que permitan la escurcion al museo"
        },
        {
            "id": 2,
            "item": "Fijar una fecha",
            "info": "Encontrar el mejor dia con la secretaria docente, en el que puedan salir toda la jornada"
        }
    ]
}
```

### Create Condition
URL: POST "follows/:id_follow/condition"

headers:
  - token: USER TOKEN

body request:
```javascript
{
	"item": "Cuota de inscripcion",
	"info": "Pedirla con una semana de anticipacion"
}
```

body response:
- status: 200 OK
```javascript
{
  "message":  "Condicion de planificacion creada exitosamente",
  "idCondition": 1
}
```

### destroy Condition
URL: DELETE "follows/:id_follow/condition/:id"

headers:
  - token: USER TOKEN


body response:
- status: 200 OK
```javascript
{
    "message": "Condicion de planificacion eliminada exitosamente"
}
```

##Broadcast of a FollowsMethodology

### All Broadcast (INDEX)
URL: GET "follows/:id_follow/broadcast/"

headers:
  - token: USER TOKEN

body response:
- status: 200 OK

```javascript
{
    "broadcasts": [
        {
            "id": 1,
            "moment_of_implementation": "Antes",
            "audience": "Alumnos",
            "diffusion_channel": "Comunicacion",
            "objective": "Informar de la salida al museo"
        },
        {
            "id": 2,
            "moment_of_implementation": "Durante",
            "audience": "Alumnos",
            "diffusion_channel": "Guia de trabajo",
            "objective": "Entregar y presentar el proyecto"
        },
        {
            "id": 3,
            "moment_of_implementation": "Despues",
            "audience": "Alumnos",
            "diffusion_channel": "Auto Evaluacion",
            "objective": "Que evaluen su propio desempeño y el proyecto"
        }
    ]
}
```

### Create Broadcast
URL: POST "follows/:id_follow/broadcast"

headers:
  - token: USER TOKEN

body request:
```javascript
{
  "moment_of_implementation": "Despues",
  "audience": "Alumnos",
  "diffusion_channel": "Auto Evaluacion",
  "objective": "Que evaluen su propio desempeño y el proyecto"
}
```

body response:
- status: 200 OK
```javascript
{
    "message": "Difucion creada exitosamente",
    "idBroadcast": 4
}
```

### destroy Broadcast
URL: DELETE "follows/:id_follow/broadcast/:id"

headers:
  - token: USER TOKEN


body response:
- status: 200 OK
```javascript
{
    "message": "Difucion eliminada exitosamente"
}
```

##Resources of a FollowsMethodology

### All Resource (INDEX)
URL: GET "follows/:id_follow/resource/"

headers:
  - token: USER TOKEN

body response:
- status: 200 OK

```javascript
{
    "resources": [
        {
            "id": 1,
            "item": "Guia de estudio",
            "available": true,
            "acquisition": "ya adquerido"
        },
        {
            "id": 2,
            "item": "Libros historia de Roma",
            "available": false,
            "acquisition": "se espera que el colegio coopere en la compra del producto"
        }
    ]
}
```

### Create Resource
URL: POST "follows/:id_follow/resource"

headers:
  - token: USER TOKEN

body request:
```javascript
{
  "item": "Guia de estudio",
  "available": true,
  "acquisition": "ya adquerido"
}
```

body response:
- status: 200 OK
```javascript
{
    "message": "Recurso creado exitosamente",
    "idResource": 5
}
```

### destroy Resource
URL: DELETE "follows/:id_follow/resource/:id"

headers:
  - token: USER TOKEN


body response:
- status: 200 OK
```javascript
{
    "message": "Eliminacion de Difucion exitosa"
}
```

##Binnacles of a FollowsMethodology

### All Binnacle (INDEX)
URL: GET "follows/:id_follow/binnacle/"

headers:
  - token: USER TOKEN

body response:
- status: 200 OK

```javascript
{
    "binnacles": [
        {
            "id": 1,
            "start_date": "2017-10-23",
            "finish_date": "2017-10-23",
            "objectives": "Presentar metodologia",
            "observations": "Los alumnos se comportaron muy bien en las presentaciones, parecian interesados.....",
            "advances": "Las cosas han ido bien, destacamos que......",
            "obstacles": "Un grupo pequeño no puede unirse a la salida al museo por indicacion de sus padres, hay que ver como solucionar esto.",
            "ideas": "Pedirles a los alumnos que lleven camara, ademas podemos hacer algun tipo de juego en la salida al museo."
        }
    ]
}
```

### One Binnacle (SHOW)


body response:
URL: GET "follows/:id_follow/binnacle/:id"

headers:
  - token: USER TOKEN

```javascript
{
    "binnacle": {
        "id": 2,
        "start_date": "2017-10-23",
        "finish_date": "2017-10-23",
        "objectives": "Presentar metodologia",
        "observations": "Los alu.....",
        "advances": "Las cosas han ido bien, destacamos que......",
        "obstacles": "Un grupo peq....",
        "ideas": "Pedirles a los alumn..."
    }
}
```

### Create Binnacle
URL: POST "follows/:id_follow/binnacle"

headers:
  - token: USER TOKEN

body request:
```javascript
{
  "start_date": "2017-10-23",
  "finish_date": "2017-10-23",
  "objectives": "Presentar metodologia",
  "observations": "Los alu.....",
  "advances": "Las cosas han ido bien, destacamos que......",
  "obstacles": "Un grupo peq....",
  "ideas": "Pedirles a los alumn..."
}
```

body response:
- status: 200 OK
```javascript
{
    "message": "Bitacora creada exitosamente",
    "idBinnacle": 2
}
```

### destroy Binnacle
URL: DELETE "follows/:id_follow/binnacle/:id"

headers:
  - token: USER TOKEN


body response:
- status: 200 OK
```javascript
{
    "message": "Bitacora eliminada exitosamente"
}
```

##Evaluation of a FollowsMethodology

###  Evaluation (only one for FollowsMethodology) (INDEX)
URL: GET "follows/:id_follow/evaluation/"

headers:
  - token: USER TOKEN

body response:
- status: 200 OK

```javascript
{
    "evaluation": {
        "id": 1,
        "comments_connect": "Opinion de la primera etapa de v...",
        "comments_select": "Opinion de la segunda etapa ....",
        "comments_planning": "Opinion de la 3° etapa de ....",
        "comments_implementation": "Opinion  de la 4°......",
        "users_reflection": "Reflecciones de los usuarios .....",
        "users_suggestions": "Sugerencias de los usuarios ..."
    }
}
```

### Create Evaluation
URL: POST "follows/:id_follow/evaluation"

headers:
  - token: USER TOKEN

body request:
```javascript
{
  "comments_connect": "Opinion de la primera etapa de v...",
  "comments_select": "Opinion de la segunda etapa ....",
  "comments_planning": "Opinion de la 3° etapa de ....",
  "comments_implementation": "Opinion  de la 4°......",
  "users_reflection": "Reflecciones de los usuarios .....",
  "users_suggestions": "Sugerencias de los usuarios ..."
}
```

body response:
- status: 200 OK
```javascript
{
    "message": "Evaluacion exitosa",
    "idEvaluation": 2
}
```

### destroy Evaluation
URL: DELETE "follows/:id_follow/evaluation/:id"

headers:
  - token: USER TOKEN


body response:
- status: 200 OK
```javascript
{
    "message": "Eliminacion exitosa"
}
```

##Report of a FollowsMethodology

###  Report (only one for FollowsMethodology) (INDEX)
URL: GET "follows/:id_follow/report/"

headers:
  - token: USER TOKEN

body response:
- status: 200 OK

```javascript
{
    "report": {
        "id": 1,
        "comment": "Esta es la etapa 6 de comunicar, agrgando un comentario final de la opinion y el desarrollo de la metodologia."
    }
}
```

### Create Report
URL: POST "follows/:id_follow/report"

headers:
  - token: USER TOKEN

body request:
```javascript
{
  "comment": "Esta es la etapa 6 de comunicar, agrg..."
}
```

body response:
- status: 200 OK
```javascript
{
    "message": "Reporte exitoso",
    "idReport": 2
}
```

### destroy Report
URL: DELETE "follows/:id_follow/report/:id"

headers:
  - token: USER TOKEN


body response:
- status: 200 OK
```javascript
{
    "message": "Eliminacion exitosa"
}
```
