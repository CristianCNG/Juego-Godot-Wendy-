extends StaticBody2D



# warning-ignore:unused_argument
func _on_DetectorPersonaje_body_entered(body):
	$DetectorPersonaje/CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.play("caer")
	
	
func desabilitar_colisionador():
	$colisionador.set_deferred("disabled", true)
	
