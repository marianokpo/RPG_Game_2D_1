var Name = ""

var Nivel=0

var EXP=0
var EXP_Nex = 0

var Vida=0
var VidaMax = 0

var Magia=0
var MagiaMax=0

var Magias = []

var Fuerza = 0
var Defenza = 0
var Velocidad = 0
var Inteligencia = 0    #AtaqueMagico
var Constitucion = 0    #DefenzaMagica

var Clase = ""        #Espacachin/Mago/ETC

var NameSprite = ""       #String Sprite Correspondiente al PJ

func _init():
	Name = "rtr"
	Nivel = 0
	EXP_Nex = 0
	Vida = 0
	VidaMax = 0
	Magia = 0
	MagiaMax = 0
	Fuerza = 0
	Defenza = 0
	Velocidad = 0
	Inteligencia = 0
	Constitucion = 0
	Clase = ""
	NameSprite = ""
	Magias = []
	pass

func Nuevo(var nam, var niv,var Exp_n,var vid_m,
var Mag_m,var fuer, var def, var vel, var inte, 
var cont, var clas, var spr):
	Name = nam
	Nivel = niv
	EXP_Nex = Exp_n
	Vida = vid_m
	VidaMax = vid_m
	Magia = Mag_m
	MagiaMax = Mag_m
	Fuerza = fuer
	Defenza = def
	Velocidad = vel
	Inteligencia = inte
	Constitucion = cont
	Clase = clas
	NameSprite = spr
	
	pass

func Subir_Nivel():
	Nivel +=1
	EXP = EXP_Nex - EXP
	if EXP < 0 :
		EXP = 0
	EXP_Nex = EXP_Nex * 2
	_Subir_Caracteristicas()
	pass
	
func Subir_EXP(var n_exp):
	EXP += n_exp
	if EXP >= EXP_Nex :
		Subir_Nivel()
	pass
	
func Golpe_PS(var g_ps):
	Vida -= g_ps
	if Vida < 0 :
		Vida =0
	pass
	
func Gasto_MP(var g_mp):
	Magia -= g_mp
	if Magia < 0 :
		Magia = 0
	pass
	
func Restore():
	Vida = VidaMax
	Magia = MagiaMax
	
func _Subir_Caracteristicas():
	Fuerza += 1
	Defenza += 1
	Velocidad += 1
	Inteligencia += 1
	Constitucion += 1
	
	VidaMax = (Constitucion * 3)
	Vida = VidaMax
	MagiaMax = (Inteligencia * 3)
	Magia = MagiaMax
	pass

func Nueva_Magia(var AM):
	Magias.append(AM)
	pass

func ObtenerMagias():
	return Magias
	pass

func get_Name():
	return Name
	
