extends Area2D
var speed = 200

const HEALTH_UP = preload("res://Scenes/health_up.tscn")
const EXPLOSION = preload("res://Scenes/explosion.tscn")
func _process(delta: float) -> void:
	translate(Vector2.LEFT * speed * delta)
	position.y += sin(position.x * delta) *0.4


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectile"):
		explode()
		
func explode():
		var explosion = EXPLOSION.instantiate()
		explosion.global_position = global_position
		add_sibling(explosion)
		queue_free()
		if randi_range(0,5)== 0:
			var health_up = HEALTH_UP.instantiate()
			health_up.global_position = global_position
			add_sibling(health_up)
