extends Spatial

onready var spring_point = $SpringSim/SpringPoint
onready var breasts = $Body/Breasts

func _ready():
	$ui/progress.max_value=Global.Jade_max_life
	$ui/progress.value=Global.Jade_life
	$ui/life.text=str(Global.Jade_life)
	$ui/score.text=str(Global.score)
	$ui/label_add.text=str(Global.mass_add[0])+"\n"+"клик +1"
	if Global.score>Global.mass_add[0]:
		$ui/button_add.disabled=false
	$rekl/T.start()
	
var drag:bool=false
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			drag=true
		else:
			drag=false

func _physics_process(_delta):
	var o : Vector2 = spring_point.spring_offset
	var mat : ShaderMaterial = breasts.material_override
	mat.set_shader_param("spring_offset", o)
	
	if drag:
		drag=false
		Global.Jade_life-=Global.step
		$ui/progress.value=Global.Jade_life
		$ui/life.text=str(Global.Jade_life)
		Global.score+=Global.step
		$ui/score.text=str(Global.score)
		if Global.score>Global.mass_add[0]:
			$ui/button_add.disabled=false
		if Global.Jade_life<=0:
			Global.Jade_max_life=2400
			Global.Jade_life=2400
			Global.Kitana_disabled=false
			get_tree().change_scene("res://Scenes/Kitana/Kitana.tscn")

func _on_button_back_pressed():
	get_tree().change_scene("res://Scenes/Main/Main.tscn")

func _on_button_add_pressed():
	$ui/button_add.disabled=true
	Global.score-=Global.mass_add[0]
	$ui/score.text=str(Global.score)
	if(len(Global.mass_add)>1):
		Global.mass_add.pop_front()
	$ui/label_add.text=str(Global.mass_add[0])+"\n"+"клик +1"
	Global.step+=1

var time=3
func _on_Timer_timeout():
	time-=1
	if time>0:
		$rekl/Label.text="Реклама через "+str(time)
		$rekl/Timer.start()
	else:
		#Показать рекламу
		$rekl.visible=false
		$rekl/T.start()
	
func _on_T_timeout():
	$rekl.visible=true
	time=3
	$rekl/Label.text="Реклама через "+str(time)
	$rekl/Timer.start()
