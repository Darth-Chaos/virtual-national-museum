extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mesh_instance = $Desk
	var new_material = SpatialMaterial.new()
	new_material.albedo_color = Color(1, 0, 0, 1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
