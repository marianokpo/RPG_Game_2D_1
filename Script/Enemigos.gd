extends Node

var Personajes = []

func _init():
	var pj = load("res://Script/ClassEntidad.gd").new()
	
	pj.Nuevo("arche",1,20,10,3,2,2,3,3,3,StaticClases.MAGO,"arche")
	
	Personajes.append(pj)
	
	pj = load("res://Script/ClassEntidad.gd").new()
	
	pj.Nuevo("Kratos",1,45,8,1,5,2,2,1,2,StaticClases.ESPADACHIN,"Kratos")
	
	Personajes.append(pj)
	
	pj = load("res://Script/ClassEntidad.gd").new()
	
	pj.Nuevo("Regal",1,26,12,2,6,3,1,1,2,StaticClases.LUCHADOR,"Regal")
	
	Personajes.append(pj)
	
	pj = load("res://Script/ClassEntidad.gd").new()
	
	pj.Nuevo("sheena",1,33,9,2,4,2,2,2,2,StaticClases.LUCHADOR,"sheena")
	
	Personajes.append(pj)
	
	pj = load("res://Script/ClassEntidad.gd").new()
	
	pj.Nuevo("soldier",1,27,7,1,5,3,4,1,3,StaticClases.ESPADACHIN,"soldier")
	
	Personajes.append(pj)
	pass

func get_Enemigo(var rd=0):
	return Personajes[rd]
	pass
