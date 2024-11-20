extends Control


func _on_next_fase_pressed():
	var next_scene = "res://caminho/para/fase_2.tscn"  # Substitua pelo caminho da próxima fase
	var scene = load(next_scene)
	get_tree().change_scene_to(scene)
