extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TileMapLayer2/AnimationPlayer.play("movimento")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
