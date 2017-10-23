# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
##APIS

### Get all planning info for a user follow:

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
