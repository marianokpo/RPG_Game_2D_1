 extends Node2D

var Boton = "NONE"

func get_boton():
	return Boton
	pass

func _ready():

	pass

func set_name(var nam=""):
	$Name2.text = nam
	pass


func _on_Atacar_pressed():
	Boton = "ATACAR"
	pass 


func _on_Atacar_released():
	Boton = "NONE"
	pass

func _on_Magia_pressed():
	Boton = "MAGIA"
	pass # replace with function body


func _on_Magia_released():
	Boton = "NONE"
	pass # replace with function body


func _on_Escapar_pressed():
	Boton = "ESCAPAR"
	pass # replace with function body


func _on_Escapar_released():
	Boton = "NONE"
	pass # replace with function body

func _on_Defender_pressed():
	Boton = "DEFENDER"
	pass # replace with function body


func _on_Defender_released():
	Boton = "NONE"
	pass # replace with function body
