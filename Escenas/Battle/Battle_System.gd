extends Node2D

var Ataq = false
var contAtaq = 0

var CantidadPJ

var Org_Mov = Vector2()

var inicializado = false

var Esperando = false

var EntitiEspera = -1 ## 0,1,2 == player 3,4,5 == Enemy

var ArrayEnemigos = []

var AtaEnem = false

var indexEnemigoAtacado = -1

var indexAtacando = -1  # 0 1 y 2 = player     3 4 5 = enemigo

var maxtime = 0

func _ready():
	
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Escenas/Mapas/Mundo.tscn")
		pass
	if !inicializado:
		InicializarPJ()
		InicializarEnemy()
		FuncionMaxTime()
		inicializado=true
	else:
		var con=0
		for i in ArrayEnemigos.size() :
			if ArrayEnemigos[i].Vida > 0 :
				con +=1
			pass
		if con <= 0 :
			ArrayEnemigos.clear()
			SingletonEnemigo.ArrayEnemigo.clear()
			get_tree().change_scene("res://Escenas/Mapas/Mundo.tscn")
		
		con=0
		for i in CantidadPJ :
			if SingletonPersonaje.Personajes[i].Vida > 0 :
				con +=1
			pass
		
		if con <= 0 :
			get_tree().quit()
		pass
	Esperas()
	pass

func FuncionMaxTime():
	var MT = float(maxtime) / (ArrayEnemigos.size() +  CantidadPJ)
	var MTM = MT * 1000
	
	if CantidadPJ > 0 :
		$Personaje1/HUD_Battle.set_MaxTime(int(MTM))
		pass
	elif CantidadPJ > 1:
		$Personaje2/HUD_Battle.set_MaxTime(int(MTM))
		pass
	elif CantidadPJ > 2:
		$Personaje3/HUD_Battle.set_MaxTime(int(MTM))
		pass
	
	if ArrayEnemigos.size() > 0 :
		$Enemigo1/HUD_Battle.set_MaxTime(int(MTM))
		pass
	elif ArrayEnemigos.size() > 1:
		$Enemigo2/HUD_Battle.set_MaxTime(int(MTM))
		pass
	elif ArrayEnemigos.size() > 2:
		$Enemigo3/HUD_Battle.set_MaxTime(int(MTM))
		pass
	
	pass

func InicializarPJ():
	var i = SingletonPersonaje.get_SizePJ() - 1
	var nameSprite = SingletonPersonaje.get_SpriteName(0)
	maxtime += SingletonPersonaje.Personajes[0].Velocidad
	$Personaje1.set_index(0)
	$Personaje1.Cargar_datos()
	$Personaje1/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
	$Personaje1.global_position = Vector2(260,270)
	$Personaje1/HUD_Battle.set_name(SingletonPersonaje.get_Name(0))
	CantidadPJ = 1
	if( i >=1 ):
		$Personaje2.set_index(1)
		maxtime += SingletonPersonaje.Personajes[1].Velocidad
		$Personaje2.Cargar_datos()
		nameSprite = SingletonPersonaje.get_SpriteName(1)
		$Personaje2/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
		$Personaje2.global_position = Vector2(115,180)
		$Personaje2.visible = true
		$Personaje2/HUD_Battle.set_name(SingletonPersonaje.get_Name(1))
		CantidadPJ = 2
		pass
	if ( i >=2 ):
		$Personaje3.set_index(2)
		maxtime += SingletonPersonaje.Personajes[2].Velocidad
		$Personaje3.Cargar_datos()
		nameSprite = SingletonPersonaje.get_SpriteName(2)
		$Personaje3/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
		$Personaje3.global_position = Vector2(115,360)
		$Personaje3.visible = true
		$Personaje3/HUD_Battle.set_name(SingletonPersonaje.get_Name(2))
		CantidadPJ = 3
		pass
	#CantidadPJ = i
	pass

func InicializarEnemy():
	var i = SingletonEnemigo.get_size()
	ArrayEnemigos.append(SingletonEnemigo.get_Enemigo(0))
	maxtime += ArrayEnemigos[0].Velocidad
	var nameSprite = ArrayEnemigos[0].NameSprite
	$Enemigo1/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
	$Enemigo1.global_position = Vector2(725,270)
	$Enemigo1/HUD_Battle.set_name(ArrayEnemigos[0].Name)
	$Enemigo1.Cargar_datos(ArrayEnemigos[0],0)
	if( i >=1 ):
		ArrayEnemigos.append(SingletonEnemigo.get_Enemigo(1))
		maxtime += ArrayEnemigos[1].Velocidad
		nameSprite = ArrayEnemigos[1].NameSprite
		$Enemigo2/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
		$Enemigo2.global_position = Vector2(870,180)
		$Enemigo2.visible = true
		$Enemigo2/HUD_Battle.set_name(ArrayEnemigos[1].Name)
		$Enemigo2.Cargar_datos(ArrayEnemigos[1],1)
		pass
	if ( i >=2 ):
		ArrayEnemigos.append(SingletonEnemigo.get_Enemigo(2))
		maxtime += ArrayEnemigos[2].Velocidad
		nameSprite = ArrayEnemigos[2].NameSprite
		$Enemigo3/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
		$Enemigo3.global_position = Vector2(870,360)
		$Enemigo3.visible = true
		$Enemigo3/HUD_Battle.set_name(ArrayEnemigos[2].Name)
		$Enemigo3.Cargar_datos(ArrayEnemigos[2],2)
		pass
	pass


func Esperas():
	if Esperando :
		$MenuBatalla.visible = true
		if EntitiEspera == 0 :
			$MenuBatalla.set_name(SingletonPersonaje.get_Name(0))
			if Atacar_PJ($Personaje1,0) :
				Esperando = false
				EntitiEspera = -1
				$Personaje1/HUD_Battle.reset_time()
				pass
		elif EntitiEspera == 1 :
			$MenuBatalla.set_name(SingletonPersonaje.get_Name(1))
			if Atacar_PJ($Personaje2,1) :
				Esperando = false
				EntitiEspera = -1
				$Personaje2/HUD_Battle.reset_time()
				pass
		elif EntitiEspera == 2 :
			$MenuBatalla.set_name(SingletonPersonaje.get_Name(2))
			if Atacar_PJ($Personaje3,2) :
				Esperando = false
				EntitiEspera = -1
				$Personaje3/HUD_Battle.reset_time()
				pass
		elif EntitiEspera == 3 :
			AtaEnem = true
			if Atacar_Enem($Enemigo1,0) :
				AtaEnem = false
				Esperando = false
				EntitiEspera = -1
				$Enemigo1/HUD_Battle.reset_time()
				pass
		elif EntitiEspera == 4 :
			AtaEnem = true
			if Atacar_Enem($Enemigo2,1) :
				AtaEnem = false
				Esperando = false
				EntitiEspera = -1
				$Enemigo2/HUD_Battle.reset_time()
				pass
		elif EntitiEspera == 5 :
			AtaEnem = true
			if Atacar_Enem($Enemigo3,2) :
				AtaEnem = false
				Esperando = false
				EntitiEspera = -1
				$Enemigo3/HUD_Battle.reset_time()
				pass
		pass
	else:
		$MenuBatalla.visible = false
		if($Personaje1.vida > 0):
			if ($Personaje1/HUD_Battle.set_time(SingletonPersonaje.get_Velocidad(0))):
				Esperando = true
				EntitiEspera = 0
				pass
		if($Personaje2.vida > 0):
			if ($Personaje2/HUD_Battle.set_time(SingletonPersonaje.get_Velocidad(1))):
				Esperando = true
				EntitiEspera = 1
				pass
		if($Personaje3.vida > 0):
			if ($Personaje3/HUD_Battle.set_time(SingletonPersonaje.get_Velocidad(2))):
				Esperando = true
				EntitiEspera = 2
				pass
		if($Enemigo1.vida > 0):
			if ($Enemigo1/HUD_Battle.set_time(ArrayEnemigos[0].Velocidad)):
				Esperando = true
				EntitiEspera = 3
				pass
		if($Enemigo2.vida > 0):
			if ArrayEnemigos.size() >= 2:
				if ($Enemigo2/HUD_Battle.set_time(ArrayEnemigos[1].Velocidad)):
					Esperando = true
					EntitiEspera = 4
				pass
		if($Enemigo3.vida > 0):
			if ArrayEnemigos.size() >= 3 :
				if ($Enemigo3/HUD_Battle.set_time(ArrayEnemigos[2].Velocidad)):
					Esperando = true
					EntitiEspera = 5
				pass
		pass
	pass


func Atacar_PJ(var pj, var idpj):
	var terminado = false
	if indexEnemigoAtacado < 0 :
		if ( $MenuBatalla.get_boton() == "ATACAR" ):
				$Cursor.reset()
				$Cursor.visible = true
				var vidaa = []
				for i in ArrayEnemigos.size():
					vidaa.append(ArrayEnemigos[i].Vida)
					pass
				$Cursor.set_Target_Max(vidaa)
				$Cursor.target = 0
				indexEnemigoAtacado = $Cursor.get_Target_Select()
				pass
		else:
			if Ataq :
				$MenuBatalla.visible = false
				if(!pj.Ataq_Player($Enemigo1.global_position)):
					$MenuBatalla.visible = false
					Ataq = false
					terminado = true
					$Cursor.reset()
					indexEnemigoAtacado = -1
					pass
				pass
			pass
		pass
	else:
		indexEnemigoAtacado = $Cursor.get_Target_Select()
		if indexEnemigoAtacado > 0 :
			$MenuBatalla.visible = false
			$Cursor.visible = false
			indexAtacando = idpj
			if indexEnemigoAtacado == 1 :
				if !pj.Ataq_Player($Enemigo1.global_position) :
					Golpear()
					indexAtacando = -1
					$MenuBatalla.visible = false
					indexEnemigoAtacado = -1
					$Cursor.reset()
					Ataq = true
				pass
			elif indexEnemigoAtacado == 2:
				if !pj.Ataq_Player($Enemigo2.global_position) :
					Golpear()
					indexAtacando = -1
					$MenuBatalla.visible = false
					indexEnemigoAtacado = -1
					$Cursor.reset()
					Ataq = true
				pass
			elif indexEnemigoAtacado == 3:
				if !pj.Ataq_Player($Enemigo3.global_position) :
					Golpear()
					indexAtacando = -1
					$MenuBatalla.visible = false
					indexEnemigoAtacado = -1
					$Cursor.reset()
					Ataq = true
				pass
			pass
		pass
	return terminado

func Atacar_Enem(var enem, var idpj):
	$MenuBatalla.visible = false
	var terminado = false
	if indexEnemigoAtacado < 0 :
		if AtaEnem :
			var id = 0
			for i in SingletonPersonaje.get_SizePJ():
				if SingletonPersonaje.Personajes[i].Vida > 0 :
					id = i+1
					pass
				pass
			indexEnemigoAtacado = id
			pass
	else:
		if indexEnemigoAtacado > 0 :
			indexAtacando = idpj
			if indexEnemigoAtacado == 1 :
				if !enem.Ataq_Player($Personaje1.global_position) :
					GolpearPJ()
					indexAtacando = -1
					$MenuBatalla.visible = false
					indexEnemigoAtacado = -1
					$Cursor.reset()
					Ataq = false
					terminado = true
				pass
			elif indexEnemigoAtacado == 2:
				if !enem.Ataq_Player($Personaje2.global_position) :
					GolpearPJ()
					indexAtacando = -1
					$MenuBatalla.visible = false
					indexEnemigoAtacado = -1
					$Cursor.reset()
					Ataq = false
					terminado = true
				pass
			elif indexEnemigoAtacado == 3:
				if !enem.Ataq_Player($Personaje3.global_position) :
					GolpearPJ()
					indexAtacando = -1
					$MenuBatalla.visible = false
					indexEnemigoAtacado = -1
					$Cursor.reset()
					Ataq = false
					terminado = true
				pass
			pass
		pass
	return terminado


func Golpear():
	SingletonEnemigo.ArrayEnemigo[indexEnemigoAtacado-1].Golpe_PS(SingletonPersonaje.Personajes[indexAtacando].Fuerza)
	pass

func GolpearPJ():
	SingletonPersonaje.Personajes[indexEnemigoAtacado-1].Golpe_PS(ArrayEnemigos[indexAtacando].Fuerza)
	pass