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

var Clase = 0        #Espacachin/Mago/ETC

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
	Clase = 0
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
	#_Subir_Caracteristicas()
	match Clase :
		0:
			_Subir_Caracteristicas_Espadachin()
			continue
		1:
			_Subir_Caracteristicas_Luchador()
			continue
		3:
			_Subir_Caracteristicas_Mago()
			continue
		4:
			_Subir_Caracteristicas_Bestia()
			continue
		5:
			_Subir_Caracteristicas_Angel()
			continue
		6:
			_Subir_Caracteristicas_Quimera()
			continue
		
		99:
			_Subir_Caracteristicas_Boos()
			continue
	pass
	
func Subir_EXP(var n_exp):
	EXP += n_exp
	if EXP >= EXP_Nex :
		Subir_Nivel()
	pass
	
func Golpe_PS(var g_ps):
	var gol = g_ps - (Defenza / 2)
	if gol <= 0 :
		gol = 1
	Vida -= gol
	if Vida < 0 :
		Vida =0
	pass

func Golpe_PS_Magic(var g_ps):
	var gol = g_ps - (Constitucion / 2)
	if gol <= 0 :
		gol = 1
	Vida -= gol
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
	

func Nueva_Magia(var AM):
	Magias.append(AM)
	pass

func ObtenerMagias():
	return Magias
	pass

func get_Name():
	return Name

func _Subir_Caracteristicas():
	Fuerza += 1
	Defenza += 1
	Velocidad += 1
	Inteligencia += 1
	Constitucion += 1
	
	VidaMax = VidaMax + (Constitucion * 3)
	Vida = VidaMax
	MagiaMax = MagiaMax + (Inteligencia * 3)
	Magia = MagiaMax
	pass

func _Subir_Caracteristicas_Espadachin():
	Fuerza += (randi()%4)+2
	Defenza += (randi()%2)+2
	Velocidad += (randi()%2)+1
	Inteligencia += (randi()%1)
	Constitucion += (randi()%2+2)
	
	VidaMax = VidaMax + (Constitucion * (randi()%2 + 1))
	Vida = VidaMax
	MagiaMax = MagiaMax + (Inteligencia * (randi()%1 +1))
	Magia = MagiaMax
	pass

func _Subir_Caracteristicas_Luchador():
	Fuerza += randi()%4+3
	Defenza += randi()%2+1
	Velocidad += randi()%3+1
	Inteligencia += randi()%1
	Constitucion += randi()%2+1
	
	VidaMax = VidaMax + (Constitucion * randi()%3)
	Vida = VidaMax
	MagiaMax = MagiaMax + (Inteligencia * randi()%1)
	Magia = MagiaMax
	pass

func _Subir_Caracteristicas_Mago():
	Fuerza += randi()%2+1
	Defenza += randi()%2+2
	Velocidad += randi()%2+2
	Inteligencia += randi()%4+2
	Constitucion += randi()%3+2
	
	VidaMax = VidaMax + (Constitucion * randi()%2)
	Vida = VidaMax
	MagiaMax = MagiaMax + (Inteligencia * randi()%4+2)
	Magia = MagiaMax
	pass

func _Subir_Caracteristicas_Bestia():
	Fuerza += randi()%3+1
	Defenza += randi()%3+2
	Velocidad += randi()%2+3
	Inteligencia += randi()%1
	Constitucion += randi()%1
	
	VidaMax = VidaMax + (Constitucion * randi()%4 +1)
	Vida = VidaMax
	MagiaMax = MagiaMax + (Inteligencia * randi()%2)
	Magia = MagiaMax
	pass

func _Subir_Caracteristicas_Angel():
	Fuerza += randi()%1+1
	Defenza += randi()%4+2
	Velocidad += randi()%1+2
	Inteligencia += randi()%6+2
	Constitucion += randi()%6+2
	
	VidaMax = VidaMax + (Constitucion * randi()%7)
	Vida = VidaMax
	MagiaMax = MagiaMax + (Inteligencia * randi()%6+2)
	Magia = MagiaMax
	pass

func _Subir_Caracteristicas_Quimera():
	Fuerza += randi()%7+2
	Defenza += randi()%7+2
	Velocidad += randi()%4+1
	Inteligencia += randi()%1+1
	Constitucion += randi()%1+1
	
	VidaMax = VidaMax + (Constitucion * randi()%2+1)
	Vida = VidaMax
	MagiaMax = MagiaMax + (Inteligencia * randi()%1+1)
	Magia = MagiaMax
	pass

func _Subir_Caracteristicas_Boos():
	Fuerza += randi()%7+1
	Defenza += randi()%7+2
	Velocidad += randi()%1+2
	Inteligencia += randi()%4+2
	Constitucion += randi()%6+2
	
	VidaMax = VidaMax + (Constitucion * randi()%12+1)
	Vida = VidaMax
	MagiaMax = MagiaMax + (Inteligencia * randi()%4+2)
	Magia = MagiaMax
	pass
	
