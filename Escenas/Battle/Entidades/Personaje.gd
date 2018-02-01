extends Node2D

var vid = SingletonPersonaje.get_Vida(0)
var mag = SingletonPersonaje.get_Magia(0)

func _ready():
	$HUD_Battle.set_name("Mariano")
	$HUD_Battle.set_Nivel(SingletonPersonaje.get_Nivel(0))
	
	$HUD_Battle.set_VidaMax(SingletonPersonaje.get_VidaMax(0))
	$HUD_Battle.set_Vida(vid)
	
	$HUD_Battle.set_MagiaMax(SingletonPersonaje.get_MagiaMax(0))
	$HUD_Battle.set_Magia(mag)
	
	$HUD_Battle.Inicio()
	pass

func _process(delta):
	$HUD_Battle.set_Vida(vid)
	$HUD_Battle.set_Magia(mag)
	if Input.is_action_just_pressed("ui_down") :
		if vid > 1 :
			vid -=1
		pass
	if Input.is_action_just_pressed("ui_left") :
		if mag > 0 :
			mag -=1
		pass
	pass
