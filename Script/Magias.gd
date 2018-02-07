extends Node

var Magias = []

func _init():
	var mg = load("res://Script/Ataques_Magicos.gd").new()
	#		nombre,costo,para,daño,escena
	mg.Nuevo("Capturar",10,1,0,"Capturar")
	Magias.append(mg)
	
	#BolaDeFuego
	#mg.new()
	#mg.Nuevo("Bola De Fuego",3,10,1,"BolaDeFuego")
	#Magias.append(mg)
	
	#Cura
	#mg.new()
	#mg.Nuevo("Cura",3,20,-1,"Cura")
	#Magias.append(mg)
	
	
	pass
