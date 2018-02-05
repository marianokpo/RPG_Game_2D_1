extends Node

var Magias = []

func _init():
	var mg = load("res://Script/Ataques_Magicos.gd").new()
	
	mg.Nuevo("Capturar",10,1,0,"Capturar")
	
	Magias.append(mg)
	
	
	pass
