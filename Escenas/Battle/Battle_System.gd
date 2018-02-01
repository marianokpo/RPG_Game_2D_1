extends Node2D

var Ataq = false
var contAtaq = 0

var CantidadPJ = 0

var Org_Mov = Vector2()

var inicializado = false

var Esperando = false

var EntitiEspera = -1 ## 0,1,2 == player 3,4,5 == Enemy

var ArrayEnemigos = []

func _ready():
	
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Escenas/Mapas/Mundo.tscn")
		pass
	if !inicializado:
		InicializarPJ()
		InicializarEnemy()
		inicializado=true
	Esperas()
	pass

func InicializarPJ():
	var i = SingletonPersonaje.get_SizePJ() - 1
	var nameSprite = SingletonPersonaje.get_SpriteName(0)
	$Personaje1/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
	$Personaje1.global_position = Vector2(260,270)
	$Personaje1/HUD_Battle.set_name(SingletonPersonaje.get_Name(0))
	if( i >=1 ):
		nameSprite = SingletonPersonaje.get_SpriteName(1)
		$Personaje2/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
		$Personaje2.global_position = Vector2(115,180)
		$Personaje2.visible = true
		$Personaje2/HUD_Battle.set_name(SingletonPersonaje.get_Name(1))
		pass
	if ( i >=2 ):
		nameSprite = SingletonPersonaje.get_SpriteName(2)
		$Personaje3/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
		$Personaje3.global_position = Vector2(115,450)
		$Personaje3.visible = true
		$Personaje3/HUD_Battle.set_name(SingletonPersonaje.get_Name(2))
		pass
	CantidadPJ = i
	pass

func InicializarEnemy():
	var i = SingletonEnemigo.get_size()
	ArrayEnemigos.append(SingletonEnemigo.get_Enemigo(0))
	var nameSprite = ArrayEnemigos[0].NameSprite
	$Enemigo1/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
	$Enemigo1.global_position = Vector2(725,270)
	$Enemigo1/HUD_Battle.set_name(ArrayEnemigos[0].Name)
	$Enemigo1.Cargar_datos(ArrayEnemigos[0])
	if( i >=1 ):
		ArrayEnemigos.append(SingletonEnemigo.get_Enemigo(1))
		nameSprite = ArrayEnemigos[1].NameSprite
		$Enemigo2/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
		$Enemigo2.global_position = Vector2(870,180)
		$Enemigo2.visible = true
		$Enemigo2/HUD_Battle.set_name(ArrayEnemigos[1].Name)
		$Enemigo2.Cargar_datos(ArrayEnemigos[1])
		pass
	if ( i >=2 ):
		ArrayEnemigos.append(SingletonEnemigo.get_Enemigo(2))
		nameSprite = ArrayEnemigos[2].NameSprite
		$Enemigo3/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
		$Enemigo3.global_position = Vector2(870,450)
		$Enemigo3.visible = true
		$Enemigo3/HUD_Battle.set_name(ArrayEnemigos[2].Name)
		$Enemigo3.Cargar_datos(ArrayEnemigos[2])
		pass
	CantidadPJ = i
	pass
	
func Esperas():
	if Esperando :
		$MenuBatalla.visible = true
		if EntitiEspera == 0 :
			$MenuBatalla.set_name(SingletonPersonaje.get_Name(0))
			if Atacar_PJ1() :
				Esperando = false
				EntitiEspera = -1
				$Personaje1/HUD_Battle.reset_time()
				pass
		elif EntitiEspera == 1 :
			$MenuBatalla.set_name(SingletonPersonaje.get_Name(1))
			if Atacar_PJ2() :
				Esperando = false
				EntitiEspera = -1
				$Personaje2/HUD_Battle.reset_time()
				pass
		elif EntitiEspera == 2 :
			$MenuBatalla.set_name(SingletonPersonaje.get_Name(2))
			if Atacar_PJ3() :
				Esperando = false
				EntitiEspera = -1
				$Personaje3/HUD_Battle.reset_time()
				pass
		pass
	else:
		$MenuBatalla.visible = false
		if ($Personaje1/HUD_Battle.set_time(SingletonPersonaje.get_Velocidad(0))):
			Esperando = true
			EntitiEspera = 0
			pass
		elif ($Personaje2/HUD_Battle.set_time(SingletonPersonaje.get_Velocidad(1))):
			Esperando = true
			EntitiEspera = 1
			pass
		elif ($Personaje3/HUD_Battle.set_time(SingletonPersonaje.get_Velocidad(2))):
			Esperando = true
			EntitiEspera = 2
			pass
		pass
	pass

func Atacar_PJ1():
	var terminado = false
	##Ataq_Player()
	if ( $MenuBatalla.get_boton() == "ATACAR" ):
		$Personaje1.Ataq_Player($arche.global_position)
		$MenuBatalla.visible = false
		Ataq = true
		pass
	else:
		if Ataq :
			if(!$Personaje1.Ataq_Player($arche.global_position)):
				$MenuBatalla.visible = true
				Ataq = false
				terminado = true
				pass
			pass
	
	return terminado

func Atacar_PJ2():
	var terminado = false
	##Ataq_Player()
	if ( $MenuBatalla.get_boton() == "ATACAR" ):
		$Personaje2.Ataq_Player($arche.global_position)
		$MenuBatalla.visible = false
		Ataq = true
		pass
	else:
		if Ataq :
			if(!$Personaje2.Ataq_Player($arche.global_position)):
				$MenuBatalla.visible = true
				Ataq = false
				terminado = true
				pass
			pass
	
	return terminado

func Atacar_PJ3():
	var terminado = false
	##Ataq_Player()
	if ( $MenuBatalla.get_boton() == "ATACAR" ):
		$Personaje3.Ataq_Player($arche.global_position)
		$MenuBatalla.visible = false
		Ataq = true
		pass
	else:
		if Ataq :
			if(!$Personaje3.Ataq_Player($arche.global_position)):
				$MenuBatalla.visible = true
				Ataq = false
				terminado = true
				pass
			pass
	
	return terminado
