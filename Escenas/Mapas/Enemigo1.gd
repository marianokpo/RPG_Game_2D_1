extends Area2D

var entro = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if entro :
		if Singleton_Mapa.move :
			randomize()
			if (randi()%8) == 0 :
				get_tree().change_scene("res://Escenas/Battle/Battle_System.tscn")
				pass
			pass
	pass


func _on_Enemigo1_body_entered( body ):
	if body.is_in_group("PJ"):
		entro = true
		pass


func _on_Enemigo1_body_exited( body ):
	if body.is_in_group("PJ"):
		entro = false
		pass
