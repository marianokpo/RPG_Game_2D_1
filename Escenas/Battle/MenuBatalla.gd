extends Node2D

var Boton = "NONE"

func get_boton():
	return Boton
	pass

func _ready():

	pass


func _on_Atacar_pressed():
	Boton = "ATACAR"
	pass 


func _on_Atacar_released():
	Boton = "NONE"
	pass