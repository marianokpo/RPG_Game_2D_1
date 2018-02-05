extends Node

var Nombre = ""

var Costo = 0

var AliadoEnemigo = 0  # 1= Enemigo    -1 = Aliado

var Golpe = 0

var Escena = "" # Direccion de la escena de la animacion


func Nuevo(var nam="none",var cost= 0, var para = 0,
 var golp = 0, var esc=""):
	Nombre = nam
	Costo = cost
	AliadoEnemigo = para
	Golpe = golp
	Escena = esc
	pass