extends Node2D

var vid = SingletonPersonaje.Vida
var mag = SingletonPersonaje.Magia

func _ready():
	$HUD_Battle.set_name("Mariano")
	$HUD_Battle.set_Nivel(SingletonPersonaje.Nivel)
	
	$HUD_Battle.set_VidaMax(SingletonPersonaje.VidaMax)
	$HUD_Battle.set_Vida(vid)
	
	$HUD_Battle.set_MagiaMax(SingletonPersonaje.MagiaMax)
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
