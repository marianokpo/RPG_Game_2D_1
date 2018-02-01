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

func get_Name(var rd=0):
	return Personajes[rd].Name
	pass

func get_Nivel(var rd=0):
	return Personajes[rd].Nivel
	pass

func get_Vida(var rd=0):
	return Personajes[rd].Vida
	pass

func get_VidaMax(var rd=0):
	return Personajes[rd].VidaMax
	pass

func get_Magia(var rd):
	return Personajes[rd].Magia
	pass

func get_MagiaMax(var rd):
	return Personajes[rd].MagiaMax
	
func get_SpriteName(var rd):
	return Personajes[rd].NameSprite
	pass

func get_Velocidad(var rd):
	return Personajes[rd].Velocidad
	pass

func get_SizePJ():
	return Personajes.size()
	pass
