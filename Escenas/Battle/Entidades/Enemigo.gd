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

var idEnemigo = -1

var Ataq = false
var contAtaq = 0

var Org_Mov = Vector2()

var iniciado = false

func _ready():
	pass

func _process(delta):
	if iniciado :
		Update()
		$HUD_Battle.set_Vida(vida)
		$HUD_Battle.set_Magia(magia)
		if vida <= 0 :
			iniciado = false
			$AnimationPlayer.play("Derrotado")
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
			#estado = false
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
