extends Area2D

export(String, "oro", "plata", "bronce") var tipo_moneda

onready var animacion = $AnimatedSprite
onready var animacion_comer = $AnimationPlayer
onready var colision_personaje = $ColisionPersonaje


func _ready():
	animacion.play()
	

# warning-ignore:unused_argument
func _on_body_entered(body):
	DatosPlayer.sumar_monedas(tipo_moneda)
	colision_personaje.set_deferred("disabled", true)
	animacion_comer.play("consumir")
