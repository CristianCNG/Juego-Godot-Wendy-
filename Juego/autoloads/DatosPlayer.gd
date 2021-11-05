extends Node

signal actualizar_datos()
signal game_over()

var vidas = 3
var llaves = 0
var monedas_oro = 0
var monedas_plata = 0
var monedas_bronce = 0
var nivel_actual = ""
var puntaje = 0

func reset():
	vidas = 3
	monedas_bronce = 0
	monedas_oro = 0
	monedas_plata = 0
	
func generar_puntaje():
	var valor_oro = monedas_oro * 10
	var valor_plata = monedas_plata * 5
	var valor_bronce = monedas_bronce * 2
	puntaje = valor_oro + valor_plata + valor_bronce
	return puntaje
	 

func restar_vidas():
	vidas -= 1
	if vidas == 0:
		emit_signal("game_over")
	
	emit_signal("actualizar_datos")
	
func restar_llaves():
	llaves -= 1
	emit_signal("actualizar_datos")
	
func contabilizar_llaves(valor):
	llaves = valor
	emit_signal("actualizar_datos")

func sumar_monedas(moneda):
	match moneda:
		"bronce":
			monedas_bronce += 1
		"plata":
			monedas_plata += 1
		"oro":
			monedas_oro += 1
		_:
			print("ERROR")
			
	emit_signal("actualizar_datos")
	
