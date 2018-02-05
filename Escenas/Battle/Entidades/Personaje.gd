extends Node2D

var index = -1

var nivel = 1

var nombre = ""

var vida = 0
var vidaMax = 0
var magia = 0
var magiaMax = 0
var velocidad = 0
var fuerza = 1
var defenza = 1
var inteligencia = 1
var constitucion = 1

var Ataq = false
var contAtaq = 0

var Org_Mov = Vector2()

var iniciado = false

func _ready():
	pass

func _process(delta):
	if index >= 0:
		if !iniciado :
			Cargar_datos()
		else:
			Update()
			$HUD_Battle.set_Vida(vida)
			$HUD_Battle.set_Magia(magia)

func set_index(var id):
	index = id
	pass

func Cargar_datos():
	
	nivel = SingletonPersonaje.Personajes[index].Nivel

	nombre = SingletonPersonaje.Personajes[index].Name
	
	vida = SingletonPersonaje.Personajes[index].Vida
	vidaMax = SingletonPersonaje.Personajes[index].VidaMax
	magia = SingletonPersonaje.Personajes[index].Magia
	magiaMax = SingletonPersonaje.Personajes[index].MagiaMax
	velocidad = SingletonPersonaje.Personajes[index].Velocidad
	fuerza = SingletonPersonaje.Personajes[index].Fuerza
	defenza = SingletonPersonaje.Personajes[index].Defenza
	inteligencia = SingletonPersonaje.Personajes[index].Inteligencia
	constitucion = SingletonPersonaje.Personajes[index].Constitucion
	
	$HUD_Battle.set_Nivel(nivel)
	
	$HUD_Battle.set_Vida(vida)
	$HUD_Battle.set_VidaMax(vidaMax)
	
	$HUD_Battle.set_Magia(magia)
	$HUD_Battle.set_MagiaMax(magiaMax)
	
	$HUD_Battle.Inicio()
	
	iniciado = true
	pass

func Update():
	vida = SingletonPersonaje.get_Vida(index)
	magia = SingletonPersonaje.get_Magia(index)
	
	if vida<=0 :
		$AnimationPlayer.play("Derrotado")
		pass
	pass
	
	$HUD_Battle.Inicio()

func Ataq_Player(var en_pos = Vector2()):
	var estado = true
	if !Ataq :
		Org_Mov = global_position
		$AnimationPlayer.get_animation("Moverse").track_set_key_value(1,0,Org_Mov)
		$AnimationPlayer.get_animation("Moverse").track_set_key_value(1,1,en_pos)
		$AnimationPlayer.play("Moverse")
		Ataq = true
		contAtaq = 0
		$HUD_Battle.visible = false
		pass
	else:
		if(!$AnimationPlayer.is_playing() && (contAtaq == 0)):
			$AnimationPlayer.play("Atacar")
			contAtaq = 1
			estado = false
			pass
		elif(!$AnimationPlayer.is_playing() && (contAtaq == 1)):
			
			$Sprite.flip_h = !$Sprite.flip_h
			$AnimationPlayer.get_animation("Moverse").track_set_key_value(1,0,global_position)
			$AnimationPlayer.get_animation("Moverse").track_set_key_value(1,1,Org_Mov)
			$AnimationPlayer.play("Moverse")
			contAtaq = 2
			pass
		elif(!$AnimationPlayer.is_playing() && (contAtaq == 2)):
			$AnimationPlayer.play("Espera")
			$Sprite.flip_h = !$Sprite.flip_h
			contAtaq = 0
			Ataq = false
			estado = false
			$HUD_Battle.visible = true
			pass
	return estado
	pass
