#Trabajo Final
#Grupo: Coronamigos

class Alumno
	attr_accessor :dni, :nombre, :apellido, :edad, :genero
	def initialize(dni, nombre, apellido, edad, genero)
  		@dni, @nombre, @apellido, @edad, @genero = dni, nombre, apellido, edad, genero
  	end
end

class AlumnoNacional < Alumno
	attr_accessor :tipo, :promedio2do
  	def initialize(dni, nombre, apellido, edad, genero, tipo, promedio2do)
  		super(dni, nombre, apellido, edad, genero)
  		@colegio = "NACIONAL"
  		@tipo = tipo
  		@promedio2do = promedio2do
  	end
end

class AlumnoParticular < Alumno
	attr_accessor :pension, :puesto2do
  	def initialize(dni, nombre, apellido, edad, genero, pension, puesto2do)
  		super(dni, nombre, apellido, edad, genero)
  		@colegio = "PARTICULAR"
  		@pension = pension
  		@puesto2do = puesto2do
  	end
end

class Tutor
	attr_accessor :dni, :nombre, :apellido, :parentesco
	def initialize(dni, nombre, apellido, parentesco)
		@dni, @nombre, @apellido, @parentesco = dni, nombre, apellido, parentesco
	end
end

class Examen
	attr_accessor :codigoEvaluacion, :nombreEvaluacion, :numeroPregunta
	def initialize(codigoEvaluacion, nombreEvaluacion, numeroPregunta)
		@codigoEvaluacion, @nombreEvaluacion, @numeroPregunta = codigoEvaluacion, nombreEvaluacion, numeroPregunta
	end
end

class Ministerio
	def initialize
		@listaAlumnos = Array.new
	end
end
