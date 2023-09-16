extends Node2D

var Game_end = false
func _process(delta):
	if Game_end == true:
		get_tree().paused = true
	check_end()
	pass
func check_end():
	if Game_end == false:
		var spots = $Spots.get_child_count()
		for i in $Spots.get_children():
			if i.in_spot:
				spots -=1
		if spots == 0:
			$AcceptDialog.popup()
			Game_end = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AcceptDialog_confirmed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_AcceptDialog_popup_hide():
	get_tree().reload_current_scene()
	get_tree().paused = false
