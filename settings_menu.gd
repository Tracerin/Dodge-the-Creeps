extends CanvasLayer
var game_active: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_main_game_state_changed() -> void:
	game_active = not game_active
	
