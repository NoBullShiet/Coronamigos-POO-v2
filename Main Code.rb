#Trabajo Final
#Grupo: Coronavirus

class Alumno
	attr_accessor :dni, :nombre, :apellido, :edad, :genero, :CS, :RE, :EC, :puntajeFinal, :listaTutores, :resultado
	def initialize(dni, nombre, apellido, edad, genero)
  	@dni, @nombre, @apellido, @edad, @genero = dni, nombre, apellido, edad, genero
  end
end

class AlumnoNacional < Alumno
	attr_accessor :tipo, :promedio2do, :colegio
  def initialize(dni, nombre, apellido, edad, genero, tipo, promedio2do)
 		super(dni, nombre, apellido, edad, genero)
 		@colegio = "NACIONAL"
 		@tipo = tipo.upcase
 		@promedio2do = promedio2do
 	end
end

class AlumnoParticular < Alumno
	attr_accessor :pension, :puesto2do, :colegio
 	def initialize(dni, nombre, apellido, edad, genero, pension, puesto2do)
 		super(dni, nombre, apellido, edad, genero)
 		@colegio = "PARTICULAR"
 		@pension = pension
 		@puesto2do = puesto2do
 	end
end