extends Node2D

var targetMax = -1
var target1 = false
var target2 = false
var target3 = false
var target = -1

func _ready():
	pass

func _process(delta):
	if targetMax >= 1 :
		if target1 :
			$Button1.visible = true
		pass
	if targetMax >= 2 :
		if target2 :
			$Button2.visible = true
		pass
	if targetMax >= 3 :
		if target3 :
			$Button3.visible = true
		pass
	pass

func get_Target_Select():
	return target
	pass

func set_Target_Max(var vid):
	var targ = vid.size()
	for i in targ:
		if vid[i] > 0  :
			if i == 0 :
				target1 = true
				pass
			pass
			if i == 1 :
				target2 = true
				pass
			pass
			if i == 2 :
				target3 = true
				pass
			pass
		else:
			if i == 0 :
				target1 = false
				pass
			pass
			if i == 1 :
				target2 = false
				pass
			pass
			if i == 2 :
				target3 = false
				pass
			pass
			pass
		pass
	targetMax = targ
	pass

func reset():
	target = -1
	targetMax = -1
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
