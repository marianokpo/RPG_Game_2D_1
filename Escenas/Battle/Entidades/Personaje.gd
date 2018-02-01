extends Node2D

var vid = SingletonPersonaje.get_Vida(0)
var mag = SingletonPersonaje.get_Magia(0)

var Ataq = false
var contAtaq = 0

var Org_Mov = Vector2()

func _ready():
	$HUD_Battle.set_name("Mariano")
	$HUD_Battle.set_Nivel(SingletonPersonaje.get_Nivel(0))
	
	$HUD_Battle.set_VidaMax(SingletonPersonaje.get_VidaMax(0))
	$HUD_Battle.set_Vida(vid)
	
	$HUD_Battle.set_MagiaMax(SingletonPersonaje.get_MagiaMax(0))
	$HUD_Battle.set_Magia(mag)
	
	$HUD_Battle.Inicio()
	pass

func _process(delta):
	$HUD_Battle.set_Vida(vid)
	$HUD_Battle.set_Magia(mag)
	if Input.is_action_just_pressed("ui_down") :
		if vid > 1 :
			vid -=1
		pass
	if Input.is_action_just_pressed("ui_left") :
		if mag > 0 :
			mag -=1
		pass
	pass

func Ataq_Player(var en_pos = Vector2()):
	var estado = true
	if !Ataq :
		Org_Mov = global_position
		$AnimationPlayer.get_animation("Moverse").track_set_key_value(1,0,Org_Mov)
		$AnimationPlayer.get_animation("Moverse").track_set_key_value(1,1,en_pos)
		$AnimationPlayer.play("Moverse")
		Ataq = true
		contAtaq = 0
		pass
	else:
		if(!$AnimationPlayer.is_playing() && (contAtaq == 0)):
			$AnimationPlayer.play("Atacar")
			contAtaq = 1
			pass
		elif(!$AnimationPlayer.is_playing() && (contAtaq == 1)):
			
			$Sprite.flip_h = !$Sprite.flip_h
			$AnimationPlayer.get_animation("Moverse").track_set_key_value(1,0,global_position)
			$AnimationPlayer.get_animation("Moverse").track_set_key_value(1,1,Org_Mov)
			$AnimationPlayer.play("Moverse")
			contAtaq = 2
			pass
		elif(!$AnimationPlayer.is_playing() && (contAtaq == 2)):
			$AnimationPlayer.play("Espera")
			$Sprite.flip_h = !$Sprite.flip_h
			contAtaq = 0
			Ataq = false
			estado = false
			pass
		return estado
	pass
