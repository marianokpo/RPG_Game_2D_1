extends Node2D

var nivel = 1

var nombre = ""

var vida = 30
var vidaMax = 30
var magia = 0
var magiaMax = 0
var velocidad = 0
var fuerza = 1
var defenza = 1
var inteligencia = 1
var constitucion = 1

var idEnemigo = -1

var iniciado = false

func _ready():
	pass

func _process(delta):
	if iniciado :
		$HUD_Battle.set_Vida(vida)
		$HUD_Battle.set_Magia(magia)
	pass

func Cargar_datos(var En):
	nivel = En.Nivel

	nombre = En.Name
	
	vida = En.Vida
	vidaMax = vida
	magia = En.Magia
	magiaMax = magia
	velocidad = En.Velocidad
	fuerza = En.Fuerza
	defenza = En.Defenza
	inteligencia = En.Inteligencia
	constitucion = En.Constitucion
	
	$HUD_Battle.set_Nivel(nivel)
	
	$HUD_Battle.set_Vida(vida)
	$HUD_Battle.set_VidaMax(vidaMax)
	
	$HUD_Battle.set_Magia(magia)
	$HUD_Battle.set_MagiaMax(magiaMax)
	
	$HUD_Battle.Inicio()
	iniciado = true
	pass
