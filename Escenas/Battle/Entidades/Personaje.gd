extends Node2D

var vid = 100

func _ready():
	$HUD_Battle.set_name("Mariano")
	$HUD_Battle.set_Nivel(89)
	
	$HUD_Battle.set_VidaMax(100)
	$HUD_Battle.set_Vida(vid)
	
	$HUD_Battle.Inicio()
	pass

func _process(delta):
	$HUD_Battle.set_Vida(vid)
	if Input.is_action_just_pressed("ui_down") :
		if vid > 1 :
			vid -=1
		pass
	pass
