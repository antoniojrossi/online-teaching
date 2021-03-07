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
$ bundle exec rails db:migrate
```

## Ejecución de tests

```
$ bundle exec rspec
```

## Uso y definición del API
Antes de hacer uso de la aplicación es necesario lanzar el servidor web:
```
$ bundle exec rails s
```

Para facilitar la comprobación del API se han creado datos dummies que pueden ser cargados mediante la siguiente instrucción:
```
$ bundle exec rails db:seed
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


## Comentarios

### JsonAPI
En este desarrollo se usa la especificación [json:api](https://jsonapi.org) para formatear los json de respuesta. Para proyectos pequeños puede resultar un tanto verbosa, pero puede ser muy beneficioso seguir la especificación en proyectos grandes para facilitar el desarrollo de los clientes.

### Active model serializers vs jsonapi_rb
El desarrollo final de este ejercicio hace uso de la gema [active_model_serializers](https://github.com/rails-api/active_model_serializers) para serializar los datos de los modelos a formato JSON.

Inicialmente se planteó el uso de la gema [jsonapi_rb](http://jsonapi-rb.org/),pero algunos problemas con la paginación (No parecía que estuviera completamente implementada y carecía del tiempo para añadirla) hizo que finalmente se empleara active_model_serializer. De todas formas se ha dejado en la rama _jsonapi_rb_serializer_ el mismo desarrollo (con cambios menores) haciendo uso de la gema jsonapi-rb.

Aunque para proyectos pequeños la diferencia de rendimiento entre ambas alternativas es considerable, y entendiendo que para proyectos de mayor embergadura, el cuello de botella del rendimiento puede encontrarse lejos del serializador, es interesante estudiar alternativas más eficientes a active_model_serializer.

### Versionado de API
Se ha implantado un pequeño sistema de versionado del API haciendo uso de la cabecera _Accept_. Este versionado se encuentra definido en la clase [ApiVersion](https://github.com/antoniojrossi/online-teaching/blob/main/app/lib/api_version.rb).

### Autenticación y autorización
Como no era un requisito y con el cambio de serializador no había mucho tiempo extra, no se ha implementado ningún sistema de autenticación para hacer uso del API. No obstante la solución que se habría desarrollado para esta tarea es hacer uso del standard JWT (Json Web Token) con la gema [jwt](https://github.com/jwt/ruby-jwt). La idea es que cada usuario (profesor en este caso) solicitara un token usando su email y una constraseña. Tras la correcta validación de la misma, se le daría el token con caducidad de una hora. Este token viajaría en las sucesivas peticiones que haga el usaurio para identificarlo en la cabecera 'Authorization'.

### Gemas añadidas
Todas las gemas añadidas tienen la versión fijada (salvo para incrementos menores de versión) para evitar posibles problemas si se actualizan.

#### [active_model_serializers](https://github.com/rails-api/active_model_serializers)
Comentada anteriormente.

#### [will_paginate](https://github.com/mislav/will_paginate) y [api_pagination](https://github.com/davidcelis/api-pagination)
Añadidas para implementar la funcionalidad de paginación en los listados de recursos. Funcionan muy bien con active_model_serializers junto con el serializador jsonapi.

#### [rspec_rails](https://github.com/rspec/rspec-rails)
Framework de testing usado para desarrollar la aplicación. Minitest es una opción válida, pero rspec está mejor soportado por la comunidad.

#### [faker](https://github.com/faker-ruby/faker)
Generación de datos falsos usados principalmente para los tests. Funciona muy bien junto factorybot.

#### [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)
Generación de fixtures usadas para el testing. Para proyectos pequeños se puede usar la solución por defecto de rails, para desarrollos más complejos, esta gema suele dar mejores resultados.

#### [shoulda_matchers](https://github.com/thoughtbot/shoulda-matchers)
"Matchers" adicionales para un fácil testeo de modelos de Rails (validacions y asociaciones)

#### [bullet](https://github.com/flyerhzm/bullet)
Gema que detecta la ocurrencia de consultas innecesarias si se hiciera uso de la funcionalidad "eager loading" de rails. Muy útil para detectar puntos de mejora de rendimiento.

#### [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)
Limpia la base de datos entre ejecuciones de tests.