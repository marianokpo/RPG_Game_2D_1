extends Node

var Posicion_TP_X = -273.9
var Posicion_TP_Y = 181.5

var move = false

func _ready():
	pass

func se_mueve():
	move = true
	pass

func no_se_mueve():
	move = false
	pass

func set_posTP_X(var posx = 0.0):
	Posicion_TP_X = posx
	pass

func set_posTP_Y(var posy = 0.0):
	Posicion_TP_Y = posy
	pass

func set_posTP(var posx=0.0, var posy=0.0):
	Posicion_TP_X = posx
	Posicion_TP_Y = posy
	pass


func get_posTP_X():
	return Posicion_TP_X
	pass

func get_posTP_Y():
	return Posicion_TP_Y
	pass

func reset_pos():
	Posicion_TP_X = 0.0
	Posicion_TP_Y = 0.0
	pass