#Trabajo Final
#Grupo: Coronamigos
#Andres Inope

class Alumno
	attr_accessor :dni, :nombre, :apellido, :edad, :genero
	def initialize(dni, nombre, apellido, edad, genero)
  	@dni, @nombre, @apellido, @edad, @genero = dni, nombre, apellido, edad, genero
    @listaTutores = Array.new(2)
  end
end

class AlumnoNacional < Alumno
	attr_accessor :tipo, :promedio2do
  def initialize(dni, nombre, apellido, edad, genero, tipo, promedio2do)
 		super(dni, nombre, apellido, edad, genero)
 		@colegio = "NACIONAL"
 		@tipo = tipo.upcase
 		@promedio2do = promedio2do
 	end

 	def calificarSocioEconomica
 		if tipo == "RURAL"
 			return 100
		elsif tipo == "URBANA"
 			return 100
 		else
 			return 0
 		end
 	end

 	def calificarRendimiento
 		if promedio2do < 11
 			return 0
		elsif promedio2do < 14
 			return 20
		elsif promedio2do < 16
 			return 40
		elsif promedio2do < 18
 			return 60
		elsif promedio2do < 19
 			return 80
 		else
 			return 100
 		end
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

 	def calificarSocioEconomica
 		if pension <= 200
 			return 90
  	elsif pension <= 400
  		return 70
		elsif pension <= 600
 			return 50
 		else
 			return 40
 		end
 	end

 	def calificarRendimiento
 		if puesto2do < 4
 			return 100
		elsif puesto2do < 6
 			return 80
		elsif puesto2do < 11
 			return 60
		elsif puesto2do < 21
 			return 40
 		else
 			return 0
 		end
 	end
end

class Tutor
	attr_accessor :dni, :nombre, :apellido, :parentesco
	def initialize(dniAlumno, nombre, apellido, parentesco)
		@dniAlumno, @nombre, @apellido, @parentesco = dniAlumno, nombre, apellido, parentesco
	end

  def registrarTutor(alumno)
    return nil
  end
end

class Examen
	attr_accessor :codigoEvaluacion, :nombreEvaluacion, :numeroPregunta, :listaRespuestas
	def initialize(codigoEvaluacion, nombreEvaluacion, numeroPregunta)
		@codigoEvaluacion, @nombreEvaluacion, @numeroPregunta = codigoEvaluacion, nombreEvaluacion, numeroPregunta
    @listaRespuestas = Array.new(numeroPregunta)
	end

  def ingresarRespuestas(listaRespuestas)
    @listaRespuestas = listaRespuestas
  end

  def simularResultados
    for i in 0..numeroPregunta
      a = ('a'..'e').to_a.sample
      listaRespuestas[i] = a
    end
  end
end

class Ministerio
  attr_accessor :listaAlumnos
	def initialize
		@listaAlumnos = Array.new
	end

  def registrarAlumno(alumno)
    validarExistencia(alumno.dni)
    listaAlumnos.push(alumno)
  end

  def validarExistencia(dni)
    for alumno in listaAlumnos
      raise "El alumno ya ha sido registrado." if alumno.dni == dni
    end
  end

end

class Factoria
  def self.dameObjeto(tipo, *arg)
    case tipo
    when "AN"
      AlumnoNacional.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5],arg[6])
    when "AP"
      AlumnoParticular.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5],arg[6])        
    end
  end
end


class Vista
  def listarDatosGenerales(datos)
    puts "***********Listado Total - Datos Generales*************"
    for alumno in datos
      puts "#{alumno.dni} #{alumno.nombre} #{alumno.apellido} #{alumno.edad} #{alumno.genero}"
    end
  end

  def mensajeError(m)
    puts "Error: #{m}"
  end

  def mostrarValido(m)
    puts m
  end
end


class Controlador
  attr_accessor :vista, :modelo
  def initialize(vista, modelo)
    @vista = vista
    @modelo = modelo
  end

  def registrarAlumno(tipo, *arg)
    alum = Factoria.dameObjeto(tipo, *arg)
    begin
      modelo.registrarAlumno(alum)
      vista.mostrarValido("Alumno registrado exitosamente!")
    rescue Exception => e 
      vista.mensajeError(e.message)
    end
  end

  def imprimirListado
    datos = modelo.listaAlumnos
    vista.listarDatosGenerales(datos)
  end
end

minedu = Ministerio.new
vista = Vista.new
controlador = Controlador.new(vista, minedu)

controlador.registrarAlumno("AP", 78945612, "Andres", "Inope", 15, "Masculino", 1200, 5)
controlador.registrarAlumno("AN", 12365478, "Paolo", "Guerrero", 10, "Masculino", "RURAL", 15)
controlador.registrarAlumno("AP", 65412877, "Adriana", "Lima", 12, "Femenino", 1800, 8)

controlador.imprimirListado
