extends Area2D

onready var Detector_jugador = $Detectorjugador
onready var Detector_pisoton = $Detectorpisoton/colisionador
onready var Animacion = $AnimationPlayer

func _on_Detectorpisoton_body_entered(body):
	desactivar_colisionadores([Detector_jugador, Detector_pisoton])
	Animacion.stop()
	Animacion.play("morir")
	body.impulsar()


func _on_body_entered(body):
	body.respawn()
	
func desactivar_colisionadores(colisionadores):
	for colision in colisionadores:
		colision.set_deferred("disabled", true)
		colision.set_deferred("visible", false)
	
