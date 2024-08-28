extends Control

func _ready():
	$d2.disabled=Global.S02
	$d3.disabled=Global.S03
	$d4.disabled=Global.S04
	$d5.disabled=Global.S05
	$d6.disabled=Global.S06
	$d7.disabled=Global.S07
	$d8.disabled=Global.S08
	$d9.disabled=Global.S09
	$d10.disabled=Global.S10
	$d11.disabled=Global.S11
	$d12.disabled=Global.S12
	$d13.disabled=Global.S13
	$d14.disabled=Global.S14
	$d15.disabled=Global.S15
	$d16.disabled=Global.S16
	$d17.disabled=Global.S17
	$d18.disabled=Global.S18

func _on_d1_pressed():
	$Select.play()
	$AnimationPlayer.play("Sonya")

func _on_d2_pressed():
	$Select.play()
	$AnimationPlayer.play("Milina")

func _on_d3_pressed():
	$Select.play()
	$AnimationPlayer.play("Jade")

func _on_d4_pressed():
	$Select.play()
	$AnimationPlayer.play("Kitana")

func _on_d5_pressed():
	$Select.play()
	$AnimationPlayer.play("Sindel")

func _on_d6_pressed():
	$Select.play()
	$AnimationPlayer.play("Tanya")

func _on_d7_pressed():
	$Select.play()
	$AnimationPlayer.play("Frost")

func _on_d8_pressed():
	$Select.play()
	$AnimationPlayer.play("Cetrion")

func _on_d9_pressed():
	$Select.play()
	$AnimationPlayer.play("Skarlet")

func _on_d10_pressed():
	$Select.play()
	$AnimationPlayer.play("Ferra")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="Sonya":
		get_tree().change_scene("res://Scenes/Sonya/Sonya.tscn")
	elif anim_name=="Milina":
		get_tree().change_scene("res://Scenes/Milina/Milina.tscn")
	elif anim_name=="Jade":
		get_tree().change_scene("res://Scenes/Jade/Jade.tscn")
	elif anim_name=="Kitana":
		get_tree().change_scene("res://Scenes/Kitana/Kitana.tscn")
	elif anim_name=="Sindel":
		get_tree().change_scene("res://Scenes/Sindel/Sindel.tscn")
	elif anim_name=="Tanya":
		get_tree().change_scene("res://Scenes/Tanya/Tanya.tscn")
	elif anim_name=="Frost":
		get_tree().change_scene("res://Scenes/Frost/Frost.tscn")
	elif anim_name=="Cetrion":
		get_tree().change_scene("res://Scenes/Cetrion/Cetrion.tscn")
	elif anim_name=="Skarlet":
		get_tree().change_scene("res://Scenes/Skarlet/Skarlet.tscn")
	elif anim_name=="Ferra":
		get_tree().change_scene("res://Scenes/Ferra/Ferra.tscn")
