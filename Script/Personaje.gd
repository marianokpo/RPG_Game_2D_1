extends Node

var Personajes = []

func _init():
	var pj = load("res://Script/ClassEntidad.gd").new()
	
	##        nombre  nivel  EXP_N vid  mag  fue  defen
	pj.Nuevo("Mariano",1   ,10   ,10  ,1   ,6   ,2   
	##vel  int  cont
	,4   ,1   ,4   ,StaticClases.ESPADACHIN,"blue")
	
	pj.Nueva_Magia(SingletonMagias.Magias[0])
	
	Personajes.append(pj)
	
	for i in 4:
		Personajes[0].Subir_Nivel()
	
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

func get_Velocidad(var rd):
	return Personajes[rd].Velocidad
	pass

func get_SizePJ():
	return Personajes.size()
	pass
