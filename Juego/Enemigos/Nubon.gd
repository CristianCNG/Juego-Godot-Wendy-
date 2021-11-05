extends Node2D

onready var detector_jugador = $Sprite/RayCast2D
onready var posiciones_disparo = $Sprite/Posicionesdisparo
onready var carencia_disparo = $Timer
onready var sfx_rayos = $Rayos

export var rayo: PackedScene

var puede_disparar = true

# warning-ignore:unused_argument
func _process(delta):
	if detector_jugador.is_colliding() and puede_disparar:
		Disparar()
		puede_disparar = false
		carencia_disparo.start()

func Disparar():
	sfx_rayos.play()
	for posicion in posiciones_disparo.get_children():
		var nuevo_rayo = rayo.instance()
		nuevo_rayo.crear(posicion.global_position)
		add_child(nuevo_rayo)
	
		


func _on_Timer_timeout():
	puede_disparar = true
