extends Node2D

var targetMax = -1
var target = -1

func _ready():
	pass

func _process(delta):
	if targetMax == 1 :
		$Button1.visible = true
		pass
	if targetMax == 2 :
		$Button2.visible = true
		pass
	if targetMax == 3 :
		$Button2.visible = true
		pass
	pass

func get_Target_Select():
	return target
	pass

func set_Target_Max(var tar=0):
	targetMax = tar
	pass

func reset():
	target = -1
	$Button1.visible = false
	$Button2.visible = false
	$Button3.visible = false
	pass

func _on_Button1_pressed():
	target = 1
	pass 


func _on_Button2_pressed():
	target = 2
	pass


func _on_Button3_pressed():
	target = 3
	pass
