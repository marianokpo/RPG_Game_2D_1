extends Node2D

var Ataq = false
var contAtaq = 0

var CantidadPJ = 0

var Org_Mov = Vector2()

var inicializado = false

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
		
	##Ataq_Player()
	if ( $MenuBatalla.get_boton() == "ATACAR" )||Input.is_action_just_pressed("ui_accept"):
		$Personaje2.Ataq_Player($arche.global_position)
		$MenuBatalla.visible = false
		Ataq = true
		pass
	else:
		if Ataq :
			if(!$Personaje2.Ataq_Player($arche.global_position)):
				$MenuBatalla.visible = true
				Ataq = false
				pass
			pass
	
	
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
	var i = 0
	var nameSprite = "arche"
	$arche/Sprite.texture = load("res://Recursos/Battle/Personaje/"+ nameSprite +".png")
	$arche.global_position = Vector2(725,270)
	$arche/HUD_Battle.set_name("arche")
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

func Ataq_Player():
	if !Ataq :
		if ( $MenuBatalla.get_boton() == "ATACAR" )||Input.is_action_just_pressed("ui_accept"):
			$MenuBatalla.visible = false
			Org_Mov = $Personaje1.global_position
			$Personaje1/AnimationPlayer.get_animation("Moverse").track_set_key_value(1,0,Org_Mov)
			$Personaje1/AnimationPlayer.get_animation("Moverse").track_set_key_value(1,1,$arche.global_position)
			$Personaje1/AnimationPlayer.play("Moverse")
			Ataq = true
			contAtaq = 0
			pass
		pass
	else:
		if(!$Personaje1/AnimationPlayer.is_playing() && (contAtaq == 0)):
			$Personaje1/AnimationPlayer.play("Atacar")
			contAtaq = 1
			pass
		elif(!$Personaje1/AnimationPlayer.is_playing() && (contAtaq == 1)):
			
			$Personaje1/Sprite.flip_h = !$Personaje1/Sprite.flip_h
			$Personaje1/AnimationPlayer.get_animation("Moverse").track_set_key_value(1,0,$Personaje1.global_position)
			$Personaje1/AnimationPlayer.get_animation("Moverse").track_set_key_value(1,1,Org_Mov)
			$Personaje1/AnimationPlayer.play("Moverse")
			contAtaq = 2
			pass
		elif(!$Personaje1/AnimationPlayer.is_playing() && (contAtaq == 2)):
			$Personaje1/AnimationPlayer.play("Espera")
			$Personaje1/Sprite.flip_h = !$Personaje1/Sprite.flip_h
			contAtaq = 0
			$MenuBatalla.visible = true
			Ataq = false
			pass
		pass
	pass
