extends Node

var Nivel = 1
var EXP = 0
var EXPProx = 30

var VidaMax = 50
var Vida = 50

var MagiaMax = 10
var Magia = 10

var Fuerza = 5
var Defensa = 3
var Velocidad = 2
var Inteligencia = 1
var Constitucion = 6

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _Subir_Nivel(var newEXP ):
	EXP += newEXP
	if ( EXP ) >= EXPProx:
		Nivel += 1
		EXP = EXP - EXPProx
		EXPProx += EXPProx
		_Subir_Caracteristicas()
		pass
	pass

func _Subir_Caracteristicas():
	Fuerza += (randomize(3))
	Defensa += (randomize(2))
	Velocidad += (randomize(2))
	Inteligencia += (randomize(3))
	Constitucion += (randomize(6))
	
	VidaMax = (Constitucion * 3)
	Vida = VidaMax
	MagiaMax = (Inteligencia * 3)
	Magia = MagiaMax
	pass
