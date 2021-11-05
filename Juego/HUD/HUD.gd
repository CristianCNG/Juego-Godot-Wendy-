extends Control

onready var etiquetas_vidas = $ContenedorVidas/Cantidad
onready var etiquetas_monedas_doradas = $ContenedorMonedasOro/Cantidad
onready var etiquetas_monedas_plata = $ContenedorMonedasPlata/Cantidad
onready var etiquetas_monedas_bronce = $ContenedorMonedasBronce/Cantidad
onready var etiqueta_llaves = $ContenedorLlaves/Cantidad

func _ready():
# warning-ignore:return_value_discarded
	DatosPlayer.connect("actualizar_datos", self, "actualizar_hud")
	actualizar_hud()

func actualizar_hud():
	etiquetas_vidas.text = "%s" % DatosPlayer.vidas
	etiquetas_monedas_bronce.text = "%s" % DatosPlayer.monedas_bronce
	etiquetas_monedas_plata.text = "%s" % DatosPlayer.monedas_plata
	etiquetas_monedas_doradas.text = "%s" % DatosPlayer.monedas_oro
	etiqueta_llaves.text = "%s" % DatosPlayer.llaves
	
