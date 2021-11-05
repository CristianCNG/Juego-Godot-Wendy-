extends Node

signal abrir_portal()


export var menu_game_over = "res://Juego/Menus/MenuGameOver.tscn"
export var nivel_actual = ""

var numero_llaves = 0
var contenedor_llaves

func _ready():
# warning-ignore:return_value_discarded
	DatosPlayer.connect("game_over", self, "game_over")
	contenedor_llaves = get_node_or_null("Zanahorias")
	if contenedor_llaves != null:
		numero_de_llaves()
	
func numero_de_llaves():
	numero_llaves = contenedor_llaves.get_child_count()
	DatosPlayer.contabilizar_llaves(numero_llaves)
	for llave in contenedor_llaves.get_children():
		llave.connect("consumida", self, "llaves_restantes")

func llaves_restantes():
	numero_llaves -= 1
	if numero_llaves == 0:
		emit_signal("abrir_portal")

func game_over():
	DatosPlayer.nivel_actual = nivel_actual
# warning-ignore:return_value_discarded
	get_tree().change_scene(menu_game_over)
