extends Area2D

var esta_activado = false
export var proximo_nivel = ""

func _ready():
# warning-ignore:return_value_discarded
	get_parent().connect("abrir_portal", self, "play_animacion")

func _on_body_entered(body):
	if esta_activado:
		body.play_entrar_portal(global_position)
		yield(get_tree().create_timer(1.0), "timeout")
		cambiar_nivel()
		
func cambiar_nivel():
# warning-ignore:return_value_discarded
	get_tree().change_scene(proximo_nivel)

func play_animacion():
	esta_activado = true
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("activado")
