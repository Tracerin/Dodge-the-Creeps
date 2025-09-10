extends CanvasLayer
var game_active: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


func _input(event):
	if event.is_action_pressed("pause") && game_active:
		show()
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused


func _on_main_game_state_changed() -> void:
	game_active = not game_active
