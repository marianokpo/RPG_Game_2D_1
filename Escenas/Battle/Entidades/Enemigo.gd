extends Node2D

var vid = 30
var mag = 0

func _ready():
	$HUD_Battle.set_name("Arche")
	$HUD_Battle.set_Nivel(2)
	
	$HUD_Battle.set_VidaMax(30)
	$HUD_Battle.set_Vida(vid)
	
	$HUD_Battle.set_MagiaMax(0)
	$HUD_Battle.set_Magia(mag)
	
	$HUD_Battle.Inicio()
	pass


func _process(delta):
	$HUD_Battle.set_Vida(vid)
	$HUD_Battle.set_Magia(mag)
	pass
