# Online Teaching
Aplicación rails (solo API) para el registro de profesores y cursos a impartir.

## Prerequisitos
Es necesario disponer de las siguientes dependencias antes de instalar el proyecto:

- Ruby 3.0+
- Bundler
- Mysql

## Instalación

```
$ git clone git@github.com:antoniojrossi/online-teaching.git
$ cd online-teaching
$ bundle install
```

## Ejecución de tests

```
$ bundle exec rspec
```

## Uso
Antes de hacer uso de la aplicación es necesario lanzar el servidor web:
```
$ bundle exec rails s
```

### Cursos
| Method | PATH | Query params | Path variables | Descripción |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| GET  | /courses  | | | Obtiene el listado completo de cursos. Soporta paginación |
| GET  | /courses/:id  | | Id del curso | Obtiene información del curso indicado |
| POST  | /courses  | **title**: Título del curso | | Crea un nuevo curso con el título indicado |
| PUT  | /courses/:id  | **title**: Nuevo título del curso | Id del curso a actualizar | Actualiza el título del curso indicado |
| DELETE  | /courses/:id  | | Id del curso | Elimina el curso indicado |

### Profesores
| Method | PATH | Query params | Path variables | Descripción |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| GET  | /teachers  | | | Obtiene el listado completo de profesores. Soporta paginación |
| GET  | /teachers/:id  | | Id del profesor | Obtiene información del profesor indicado |
| POST  | /teachers  | **email**: Email del profesor | | Crea un nuevo profesor con el email indicado |
| PUT  | /teachers/:id  | **email**: Nuevo email del profesor | Id del profesor a actualizar | Actualiza el email del profesor indicado |
| DELETE  | /teachers/:id  | | Id del profesor | Elimina el profesor indicado |

### Cursos propuestos
| Method | PATH | Query params | Path variables | Descripción |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| GET  | /proposed_courses  | | | Obtiene el listado completo de cursos propuestos y el profesor que lo hizo. Soporta paginación |
| POST  | /proposed_courses  | **teacher_id**: Id del profesor que propone el curso **course_id**: Id del curso propuesto| | Crea una nueva propuesta de curso |

### Votos
| Method | PATH | Query params | Path variables | Descripción |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| POST  | /teachers/:teacher_id/votes  | **voter_id**: Profesor que realiza el voto| Id del profesor votado| Se añade un voto del profesor indicado por __voter_id__ al profesor indicado por  __teacher_id__
| POST  | /courses/:course_id/votes  | **voter_id**: Id del profesor que realiza el voto| Id del curso votado | Se añade un voto del profesor indicado por __voter_id__ al curso indicado por __course_id__ |

## Pruebas
En el directorio _utils_ se encuentran disponibles, listos para su importación en la aplicación [postman](https://www.postman.com/downloads/), la colección y entorno creados para poder probar cada endpoint del API publicada desde dicha aplicación.


## Notas finales

### Active model serializers vs jsonapi_rb
El desarrollo final de este ejercicio hace uso de la gema [active_model_serializers](https://github.com/rails-api/active_model_serializers) para serializar los datos de los modelos a formato JSON.

Inicialmente se planteó el uso de la gema [jsonapi_rb](http://jsonapi-rb.org/),pero algunos problemas con la paginación (No parecía que estuviera completamente implementada y carecía del tiempo para añadirla) hizo que finalmente se empleara active_model_serializer. De todas formas se ha dejado en la rama _jsonapi_rb_serializer_ el mismo desarrollo (con cambios menores) haciendo uso de la gema jsonapi-rb.

Aunque para proyectos pequeños la diferencia de rendimiento entre ambas alternativas es considerable, y entendiendo que para proyectos de mayor embergadura, el cuello de botella del rendimiento puede encontrarse lejos del serializador, es interesante estudiar alternativas más eficientes a active_model_serializer.

### Versionado de API
Se ha implantado un pequeño sistema de versionado del API haciendo uso de la cabecera _Accept_. Este versionado se encuentra definido en la clase [ApiVersion](https://github.com/antoniojrossi/online-teaching/blob/main/app/lib/api_version.rb).

