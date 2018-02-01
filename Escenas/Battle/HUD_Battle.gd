extends Node2D

var Vida =0
var VidaMax=0
var time = 1000
var maxtime = 1000

var Magia =0
var MagiaMax =0

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

func set_Magia(var mag=0):
	Magia = mag
	pass

func set_MagiaMax(var magM=0):
	MagiaMax = magM
	pass

func set_time(var tim=0):
	time -= tim
	if time <=0 :
		return true
	else:
		return false
	pass

func get_time():
	return time
	pass

func reset_time():
	time = maxtime
	pass

func Inicio():
	iniciar = true

func _process(delta):
	if iniciar  :
		$PS_ENTIDAD.text = String(Vida) + "/" + String(VidaMax)
		var rec = ($ColorRectFondo.margin_right * Vida)  / VidaMax
		$ColorRectVida.margin_right = rec
		
		rec = ($ColorRectFondo3.margin_right * time)  / maxtime
		$ColorRectTiempo.margin_right = rec
		
		if( MagiaMax > 0 ):
			$MP_ENTIDAD.text = String(Magia) + "/" + String(MagiaMax)
			rec = ($ColorRectFondo.margin_right * Magia)  / MagiaMax
			$ColorRectMagia.margin_right = rec
		else:
			$MP.visible = false
			$ColorRectMagia.visible = false
			$ColorRectFondo2.visible = false
			$MP_ENTIDAD.visible = false
			pass
		pass
	pass
