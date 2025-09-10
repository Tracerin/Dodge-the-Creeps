extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Dodge the Creeps!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	$Settings.show()


func update_score(score):
	$ScoreLabel.text = str(score)


func _on_start_button_pressed() -> void:
	$StartButton.hide()
	$Settings.hide()
	start_game.emit()


func _on_message_timer_timeout() -> void:
	$Message.hide()


func _on_settings_pressed() -> void:
	$StartButton.hide()
	$Message.hide()
	$ScoreLabel.hide()
	$Settings.hide()
	$Back.show()
	$SettingsMenu.show()
	


func _on_back_pressed() -> void:
	$StartButton.show()
	$Message.show()
	$ScoreLabel.show()
	$Settings.show()
	$Back.hide()
	$SettingsMenu.hide()
