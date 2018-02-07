extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$ItemList.add_item("Captura")
	$ItemList.add_item("Cura")
	$ItemList.add_item("Bola de Fuego")
	pass


func _on_ItemList_item_selected( index ):
	print("Magia: ",$ItemList.get_item_text(index))
	#$ItemList.unselect(index)
	pass # replace with function body
