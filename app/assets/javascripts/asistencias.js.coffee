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

asistenciasApp.factory 'Alumno', ['$resource', ($resource) ->
  $resource('/alumnos')
]
