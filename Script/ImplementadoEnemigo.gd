extends Node

var Enemigos = load("res://Script/Enemigos.gd").new()

var ArrayEnemigo = []

func _init():
	pass

func get_size():
	return (ArrayEnemigo.size() - 1)
	pass

func get_Enemigo(var index=0):
	return ArrayEnemigo[index]
	pass

func GenerarEnemigos(var Enem, var lvlStandar):
	ArrayEnemigo.empty()
	var ran = (randi()%3)+ 1
	for i in ran :
		var ran2 =  randi()%Enem.size()
		AddEnemigos(Enem[ran2],lvlStandar,(i+1))
	#AddEnemigos(Enem[1],lvlStandar,2)
	#AddEnemigos(Enem[3],lvlStandar,3)
	pass

func BorrarTodo():
	ArrayEnemigo.empty()
	pass

func AddEnemigos(var id, var Lvl, var nam=0):
	var Enem = load("res://Script/ClassEntidad.gd").new()
	Enemigos = load("res://Script/Enemigos.gd").new()
	Enem = Enemigos.get_Enemigo(id)
	GenerarLvlEnemigo(Enem,Lvl,nam)
	pass

func GenerarLvlEnemigo(var Enem, var Lvl, var nam=0):
	var newLvl = Lvl
	newLvl += ((randi()%3) - 1)
	Enem.Name = Enem.Name + " " + String(nam)
	Enem.Nivel = newLvl
	for i in newLvl - 1:
		Enem.Vida += 30
		Enem.VidaMax +=3
		Enem.Magia += 3
		Enem.MagiaMax +=3
		
		Enem.Fuerza +=2
		Enem.Defenza +=1
		Enem.Velocidad +=1
		Enem.Inteligencia +=1
		Enem.Constitucion +=1
		pass
	
	ArrayEnemigo.append(Enem)
	pass