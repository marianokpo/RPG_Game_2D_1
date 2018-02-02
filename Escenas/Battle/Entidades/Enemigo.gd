extends Node2D

var index = -1

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
		Update()
		$HUD_Battle.set_Vida(vida)
		$HUD_Battle.set_Magia(magia)
		if vida <= 0 :
			##SingletonEnemigo.ArrayEnemigo.erase(SingletonEnemigo.ArrayEnemigo[index])
			iniciado = false
			global_position = Vector2( -1000, -1000)
			visible = false
			pass
	pass

func Cargar_datos(var En, var ind):
	
	index = ind
	
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

func Update():
	
	vida = SingletonEnemigo.ArrayEnemigo[index].Vida
	magia = SingletonEnemigo.ArrayEnemigo[index].Magia
	
	pass
