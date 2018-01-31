extends Node2D

var Ataq = false
var contAtaq = 0

var Org_Mov = Vector2()

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Escenas/Mapas/Mundo.tscn")
		pass
		
	Ataq_Player()
	
	pass

func Ataq_Player():
	if !Ataq :
		if ( $MenuBatalla.get_boton() == "ATACAR" )||Input.is_action_just_pressed("ui_accept"):
			$MenuBatalla.visible = false
			Org_Mov = $Personaje.global_position
			$Personaje/AnimationPlayer.get_animation("Moverse").track_set_key_value(1,0,Org_Mov)
			$Personaje/AnimationPlayer.get_animation("Moverse").track_set_key_value(1,1,$arche.global_position)
			$Personaje/AnimationPlayer.play("Moverse")
			Ataq = true
			contAtaq = 0
			pass
		pass
	else:
		if(!$Personaje/AnimationPlayer.is_playing() && (contAtaq == 0)):
			$Personaje/AnimationPlayer.play("Atacar")
			contAtaq = 1
			pass
		elif(!$Personaje/AnimationPlayer.is_playing() && (contAtaq == 1)):
			
			$Personaje/Sprite.flip_h = !$Personaje/Sprite.flip_h
			$Personaje/AnimationPlayer.get_animation("Moverse").track_set_key_value(1,0,$Personaje.global_position)
			$Personaje/AnimationPlayer.get_animation("Moverse").track_set_key_value(1,1,Org_Mov)
			$Personaje/AnimationPlayer.play("Moverse")
			contAtaq = 2
			pass
		elif(!$Personaje/AnimationPlayer.is_playing() && (contAtaq == 2)):
			$Personaje/AnimationPlayer.play("Espera")
			$Personaje/Sprite.flip_h = !$Personaje/Sprite.flip_h
			contAtaq = 0
			$MenuBatalla.visible = true
			Ataq = false
			pass
		pass
	pass
