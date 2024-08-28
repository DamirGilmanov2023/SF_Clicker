extends Control

func _ready():
	$d2.disabled=G.S["S2"]
	$d3.disabled=G.S["S3"]
	$d4.disabled=G.S["S4"]
	$d5.disabled=G.S["S5"]
	$d6.disabled=G.S["S6"]
	$d7.disabled=G.S["S7"]
	$d8.disabled=G.S["S8"]
	$d9.disabled=G.S["S9"]
	$d10.disabled=G.S["S10"]
	$d11.disabled=G.S["S11"]
	$d12.disabled=G.S["S12"]
	$d13.disabled=G.S["S13"]
	$d14.disabled=G.S["S14"]
	$d15.disabled=G.S["S15"]
	$d16.disabled=G.S["S16"]
	$d17.disabled=G.S["S17"]
	$d18.disabled=G.S["S18"]

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="S1":
		G.current_level="1"
		get_tree().change_scene("res://Scenes/S1/S1.tscn")
	elif anim_name=="S2":
		G.current_level="2"
		get_tree().change_scene("res://Scenes/S2/S2.tscn")
	elif anim_name=="S3":
		G.current_level="3"
		get_tree().change_scene("res://Scenes/S3/S3.tscn")
	elif anim_name=="S4":
		G.current_level="4"
		get_tree().change_scene("res://Scenes/S4/S4.tscn")
	elif anim_name=="S5":
		G.current_level="5"
		get_tree().change_scene("res://Scenes/S5/S5.tscn")
	elif anim_name=="S6":
		G.current_level="6"
		get_tree().change_scene("res://Scenes/S6/S6.tscn")
	elif anim_name=="S7":
		G.current_level="7"
		get_tree().change_scene("res://Scenes/S7/S7.tscn")
	elif anim_name=="S8":
		G.current_level="8"
		get_tree().change_scene("res://Scenes/S8/S8.tscn")
	elif anim_name=="S9":
		G.current_level="9"
		get_tree().change_scene("res://Scenes/S9/S9.tscn")
	elif anim_name=="S10":
		G.current_level="10"
		get_tree().change_scene("res://Scenes/S10/S10.tscn")
	elif anim_name=="S11":
		G.current_level="11"
		get_tree().change_scene("res://Scenes/S11/S11.tscn")
	elif anim_name=="S12":
		G.current_level="12"
		get_tree().change_scene("res://Scenes/S12/S12.tscn")
	elif anim_name=="S13":
		G.current_level="13"
		get_tree().change_scene("res://Scenes/S13/S13.tscn")
	elif anim_name=="S14":
		G.current_level="14"
		get_tree().change_scene("res://Scenes/S14/S14.tscn")
	elif anim_name=="S15":
		G.current_level="15"
		get_tree().change_scene("res://Scenes/S15/S15.tscn")
	elif anim_name=="S16":
		G.current_level="16"
		get_tree().change_scene("res://Scenes/S16/S16.tscn")
	elif anim_name=="S17":
		G.current_level="17"
		get_tree().change_scene("res://Scenes/S17/S17.tscn")
	elif anim_name=="S18":
		G.current_level="18"
		get_tree().change_scene("res://Scenes/S18/S18.tscn")

func _on_d1_pressed():
	$Select.play()
	$AnimationPlayer.play("S1")

func _on_d2_pressed():
	$Select.play()
	$AnimationPlayer.play("S2")


func _on_d3_pressed():
	$Select.play()
	$AnimationPlayer.play("S3")


func _on_d4_pressed():
	$Select.play()
	$AnimationPlayer.play("S4")


func _on_d5_pressed():
	$Select.play()
	$AnimationPlayer.play("S5")


func _on_d6_pressed():
	$Select.play()
	$AnimationPlayer.play("S6")

func _on_d7_pressed():
	$Select.play()
	$AnimationPlayer.play("S7")

func _on_d8_pressed():
	$Select.play()
	$AnimationPlayer.play("S8")

func _on_d9_pressed():
	$Select.play()
	$AnimationPlayer.play("S9")

func _on_d10_pressed():
	$Select.play()
	$AnimationPlayer.play("S10")

func _on_d11_pressed():
	$Select.play()
	$AnimationPlayer.play("S11")

func _on_d12_pressed():
	$Select.play()
	$AnimationPlayer.play("S12")

func _on_d13_pressed():
	$Select.play()
	$AnimationPlayer.play("S13")

func _on_d14_pressed():
	$Select.play()
	$AnimationPlayer.play("S14")
	
func _on_d15_pressed():
	$Select.play()
	$AnimationPlayer.play("S15")
	
func _on_d16_pressed():
	$Select.play()
	$AnimationPlayer.play("S16")
	
func _on_d17_pressed():
	$Select.play()
	$AnimationPlayer.play("S17")
	
func _on_d18_pressed():
	$Select.play()
	$AnimationPlayer.play("S18")
