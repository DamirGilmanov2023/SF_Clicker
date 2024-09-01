extends Node2D

func _ready():
	$AnimationPlayer.play("logo")
	yield(get_tree().create_timer(3),"timeout")
	G.js_get_data()
	G.get_lang()

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/Main/Main.tscn")
