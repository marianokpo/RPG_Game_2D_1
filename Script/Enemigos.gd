extends Node

var Personajes = []

func _init():
	var pj = load("res://Script/ClassEntidad.gd").new()
	
	pj.Nuevo("arche",2,30,10,2,3,2,2,1,2,"ESPADACHIN","arche")
	
	Personajes.append(pj)
	
	pj = load("res://Script/ClassEntidad.gd").new()
	
	pj.Nuevo("Kratos",2,30,10,2,3,2,2,1,2,"ESPADACHIN","Kratos")
	
	Personajes.append(pj)
	
	pj = load("res://Script/ClassEntidad.gd").new()
	
	pj.Nuevo("Regal",2,30,10,2,3,2,2,1,2,"ESPADACHIN","Regal")
	
	Personajes.append(pj)
	
	pj = load("res://Script/ClassEntidad.gd").new()
	
	pj.Nuevo("sheena",2,30,10,2,3,2,2,1,2,"ESPADACHIN","sheena")
	
	Personajes.append(pj)
	
	pj = load("res://Script/ClassEntidad.gd").new()
	
	pj.Nuevo("soldier",2,30,10,2,3,2,2,1,2,"ESPADACHIN","soldier")
	
	Personajes.append(pj)
	pass

func get_Enemigo(var rd=0):
	return Personajes[rd]
	pass
