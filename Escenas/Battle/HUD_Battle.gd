extends Node2D

var Vida =0
var VidaMax=0

var iniciar = false


func _ready():
	pass

func set_name(var Nom = ""):
	$Nombre.text = Nom
	pass

func set_Nivel(var Lv):
	$Nivel.text = "Nivel: " + String(Lv)
	pass

func set_Vida(var vid=0):
	Vida = vid
	pass

func set_VidaMax(var vidM=0):
	VidaMax = vidM
	pass

func Inicio():
	iniciar = true

func _process(delta):
	if iniciar  :
		$PS_ENTIDAD.text = String(Vida) + "/" + String(VidaMax)
		var rec = ($ColorRectFondo.margin_right * Vida)  / 100
		$ColorRectVida.margin_right = rec
		pass
	pass
