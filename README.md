# README

## Endpoints

### Get all planning info of a Followed Methodology

URL: GET "follows/:id_follow/plannings"

HEADERS:
  - token: USER TOKEN

RESPONSE:
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

HEADERS:
  - token: USER TOKEN

RESPONSE:
  - status: 200 OK
```javascript
    {"message": "Eliminacion exitosa"}
```

### Create Planning
URL: POST "follows/:id_follow/planning/"

HEADERS:
  - token: USER TOKEN

EXAMPLE REQUEST:
```javascript
{
	"initiative_name": "Proyectos!!!",
	"objective": "Lograr hacer proyectos",
	"place": "Curso de diseño",
	"start_date": "2017-10-30",
	"finish_date": "2017-12-30"
}
```

RESPONSE:
  - status: 200 OK

```javascript
    {
      "message": "Creacion exitosa",
      "idPlanning": 1
    }
```

## Work Roles of a Followed Methodology

### All Work Roles (INDEX)
URL: GET "follows/:id_follow/work_roles/"

HEADERS:
  - token: USER TOKEN

RESPONSE:
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

### Create Work Role
URL: POST "follows/:id_follow/work_role"

HEADERS:
  - token: USER TOKEN

EXAMPLE REQUEST:
```javascript
{
	"name": "Pablo Ovalle",
	"role": "Ayudante jefe"
}
```

RESPONSE:
  - status: 200 OK
```javascript
 {
   "message": "Rol de trabajo creado exitosamente",
   "idWorkRole": rol.id
 }
```
### Delete Work Role
URL: DELETE "follows/:id_follow/work_role/:id"

HEADERS:
  - token: USER TOKEN

RESPONSE:
  - status: 200 OK
  
```javascript
 {
   "message": "Rol de trabajo eliminado exitosamente"
 }
```

## Conditions of a Followed Methodology

### All Conditions (INDEX)
URL: GET "follows/:id_follow/condition/"

HEADERS:
  - token: USER TOKEN

RESPONSE:
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

HEADERS:
  - token: USER TOKEN

EXAMPLE REQUEST:
```javascript
{
	"item": "Cuota de inscripcion",
	"info": "Pedirla con una semana de anticipacion"
}
```

RESPONSE:
  - status: 200 OK
```javascript
{
  "message":  "Condicion de planificacion creada exitosamente",
  "idCondition": 1
}
```

### Delete Condition
URL: DELETE "follows/:id_follow/condition/:id"

HEADERS:
  - token: USER TOKEN

RESPONSE:
  - status: 200 OK
```javascript
{
    "message": "Condicion de planificacion eliminada exitosamente"
}
```

## Broadcast of a Followed Methodology

### All Broadcasts (INDEX)
URL: GET "follows/:id_follow/broadcast/"

HEADERS:
  - token: USER TOKEN

RESPONSE:
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

HEADERS:
  - token: USER TOKEN

EXAMPLE REQUEST:
```javascript
{
  "moment_of_implementation": "Despues",
  "audience": "Alumnos",
  "diffusion_channel": "Auto Evaluacion",
  "objective": "Que evaluen su propio desempeño y el proyecto"
}
```

RESPONSE:
  - status: 200 OK
```javascript
{
    "message": "Difucion creada exitosamente",
    "idBroadcast": 4
}
```

### Delete Broadcast
URL: DELETE "follows/:id_follow/broadcast/:id"

HEADERS:
  - token: USER TOKEN


RESPONSE:
  - status: 200 OK
```javascript
{
    "message": "Difucion eliminada exitosamente"
}
```

## Resources of a Followed Methodology

### All ResourceS (INDEX)
URL: GET "follows/:id_follow/resource/"

HEADERS:
  - token: USER TOKEN

RESPONSE:
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

HEADERS:
  - token: USER TOKEN

EXAMPLE REQUEST:
```javascript
{
  "item": "Guia de estudio",
  "available": true,
  "acquisition": "ya adquerido"
}
```

RESPONSE:
  - status: 200 OK
```javascript
{
    "message": "Recurso creado exitosamente",
    "idResource": 5
}
```

### Delete Resource
URL: DELETE "follows/:id_follow/resource/:id"

HEADERS:
  - token: USER TOKEN

RESPONSE:
  - status: 200 OK
```javascript
{
    "message": "Eliminacion de Difucion exitosa"
}
```

## Binnacles of a Followed Methodology

### All Binnacles (INDEX)
URL: GET "follows/:id_follow/binnacle/"

HEADERS:
  - token: USER TOKEN

RESPONSE:
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

### Show Binnacle

URL: GET "follows/:id_follow/binnacle/:id"

HEADERS:
  - token: USER TOKEN

RESPONSE:
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

HEADERS:
  - token: USER TOKEN

EXAMPLE REQUEST:
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

RESPONSE:
  - status: 200 OK
```javascript
{
    "message": "Bitacora creada exitosamente",
    "idBinnacle": 2
}
```

### Delete Binnacle
URL: DELETE "follows/:id_follow/binnacle/:id"

HEADERS:
  - token: USER TOKEN

RESPONSE:
  - status: 200 OK
```javascript
{
    "message": "Bitacora eliminada exitosamente"
}
```

## Evaluation of a Followed Methodology

###  Show Evaluation
URL: GET "follows/:id_follow/evaluation/"

HEADERS:
  - token: USER TOKEN

RESPONSE:
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

HEADERS:
  - token: USER TOKEN

EXAMPLE REQUEST:
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

RESPONSE:
  - status: 200 OK
```javascript
{
    "message": "Evaluacion exitosa",
    "idEvaluation": 2
}
```

### Delete Evaluation
URL: DELETE "follows/:id_follow/evaluation/:id"

HEADERS:
  - token: USER TOKEN

RESPONSE:
  - status: 200 OK
```javascript
{
    "message": "Eliminacion exitosa"
}
```

## Report of a Followed Methodology

###  Show Report
URL: GET "follows/:id_follow/report/"

HEADERS:
  - token: USER TOKEN

RESPONSE:
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

HEADERS:
  - token: USER TOKEN

EXAMPLE REQUEST:
```javascript
{
  "comment": "Esta es la etapa 6 de comunicar, agrg..."
}
```

RESPONSE:
  - status: 200 OK
```javascript
{
    "message": "Reporte exitoso",
    "idReport": 2
}
```

### Delete Report
URL: DELETE "follows/:id_follow/report/:id"

HEADERS:
  - token: USER TOKEN

RESPONSE:
  - status: 200 OK
```javascript
{
    "message": "Eliminacion exitosa"
}
```

## Show Methodologies followed by user
URL: GET "follows/"

HEADERS:
  - token: USER TOKEN
  
RESPONSE:
  - status: 200 OK
```javascript
[
    {
        "id": 1,
        "user_id": 1,
        "methodology_id": 1,
        "created_at": "2017-10-19T03:35:58.143Z",
        "updated_at": "2017-10-19T03:35:58.143Z"
    }
]
```

## Follow Methodology
URL: POST "follows/"

HEADERS:
  - token: USER TOKEN
  
PARAMS:
  - user: USER ID
  - methodology: METHODOLOGY ID
  
RESPONSE:
  - status: 200 OK
```javascript
  {
      "message": "Seguimiento realizado con exito",
      "idFollow": 1
  }
```

## Unfollow Methodology
URL: DELETE "follows/:methodology_id"

HEADERS:
  - token: USER TOKEN
  
RESPONSE:
  - status: 200 OK
