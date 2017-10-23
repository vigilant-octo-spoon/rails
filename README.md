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
