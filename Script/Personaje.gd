extends Node



var Personajes = []

func _init():
	var pj = load("res://Script/ClassEntidad.gd").new()
	print(pj.get_Name())
	pj.Nuevo("Mariano",2,30,10,2,3,2,2,1,2,"ESPADACHIN","blue")
	
	Personajes.append(pj)
	
	var pj2 = preload("res://Script/ClassEntidad.gd").new()
	pj2.Nuevo("Loft",2,30,10,2,3,2,2,1,2,"ESPADACHIN","arche")
	
	Personajes.append(pj2)
	
	var pj3 = preload("res://Script/ClassEntidad.gd").new()
	pj3.Nuevo("Glup",2,30,10,2,3,2,2,1,2,"ESPADACHIN","sheena")
	
	Personajes.append(pj3)
	pass

func add_PJ(var pj):
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

func get_SizePJ():
	return Personajes.size()
	pass
