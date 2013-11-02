asistenciasApp = angular.module 'asistenciasApp', ['ngResource']

asistenciasApp.controller 'AlumnosCtrl', ['$scope', 'Alumno', ($scope, Alumno) ->
  $scope.alumnos = Alumno.query()

  $scope.create = () ->
    Alumno.save(
      $scope.newAlumno
      # success callback
      (resource) ->
        $scope.alumnos.push resource
        $scope.newAlumno = {}
      # failure callback
      (response) ->
        console.log 'Error', response
    )
]

asistenciasApp.controller 'EditAlumnoCtrl', ['$scope', '$location', '$routeParams', 'Alumno', ($scope, $location, $routeParams, Alumno) ->
  $scope.alumno = Alumno.get({id: $routeParams.alumnoId})

  $scope.update = () ->
    $scope.alumno.$update()
    $location.path '/'

]

asistenciasApp.config ($routeProvider) ->
  $routeProvider
    .when '/',
      controller: 'AlumnosCtrl'
      templateUrl: 'assets/alumnos.html'
    .when '/edit/:alumnoId',
      controller: 'EditAlumnoCtrl'
      templateUrl: 'assets/editar_alumno.html'
    .otherwise
      redirectTo: '/'

asistenciasApp.factory 'Alumno', ['$resource', ($resource) ->
  $resource '/alumnos/:id', { id: '@id' }, { update: { method: 'PUT' } }
]
