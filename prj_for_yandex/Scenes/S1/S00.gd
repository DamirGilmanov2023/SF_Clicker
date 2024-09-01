extends Spatial

onready var spring_point = $SpringSim/SpringPoint
onready var breasts = $Body/Breasts
onready var button_back = $ui/button_back
onready var button_add = $ui/button_add

var player
func _ready():
	var c=int(G.current_level)
	if c>15:
		c=c-15
	elif c>10:
		c=c-10
	elif c>5:
		c=c-5
	if c==1:
		player=$Audio/Play1
	elif c==2:
		player=$Audio/Play2
	elif c==3:
		player=$Audio/Play3
	elif c==4:
		player=$Audio/Play4
	elif c==5:
		player=$Audio/Play5
	player.playing=true
	G.timer+=3
	$ui/progress.max_value=G.S["S"+G.current_level+"_max_life"]
	$ui/progress.value=G.S["S"+G.current_level+"_life"]
	$ui/life.text=str(G.S["S"+G.current_level+"_life"])
	$ui/score.text=str(G.score)
	if G.lang=="ru":
		$ui/label_add.text=str(G.mass_add[0])+"\n"+"клик +1"
	else:
		$ui/label_add.text=str(G.mass_add[0])+"\n"+"click +1"
	if G.score>G.mass_add[0]:
		$ui/button_add.disabled=false
	$rekl/T.start()
	
	button_back.connect("pressed", self, "_on_button_back_pressed")
	button_add.connect("pressed", self, "_on_button_add_pressed")
	
	G.connect('foc_unfoc',self,'_foc_unfoc')
	G.js_foc_unfoc()
	
	G.connect("ad",self,'_ad')
	
	G.click=true

func _foc_unfoc(value):
	if value=="foc":
		get_tree().paused=false
	elif value=="unfoc":
		get_tree().paused=true

func _ad(value):
	if value==true or value==false:
		get_tree().paused=false
		player.playing=true
		G.click=true

var flag_safe:bool=true

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
	
	if drag and G.click:
		$heart/particl.emitting=true
		drag=false
		if flag_safe:
			flag_safe=false
			$TimerSafe.start()
		G.S["S"+G.current_level+"_life"]-=G.step
		if G.S["S"+G.current_level+"_life"]>0:
			$ui/progress.value=G.S["S"+G.current_level+"_life"]
			$ui/life.text=str(G.S["S"+G.current_level+"_life"])
		else:
			$ui/progress.value=0
			$ui/life.text=str(0)
		G.score+=G.step
		$ui/score.text=str(G.score)
		if G.score>G.mass_add[0]:
			$ui/button_add.disabled=false
		if G.S["S"+G.current_level+"_life"]<=0:
			G.S["S"+G.current_level+"_max_life"]=5000
			G.S["S"+G.current_level+"_life"]=5000
			var num_cur=int(G.current_level)
			if num_cur<18:
				G.current_level=str(num_cur+1)
				G.S["S"+G.current_level]=false
				#print(G.current_level,G.S["S"+G.current_level])
				player.playing=false
				G.safe_data()
				yield(get_tree().create_timer(0.3),"timeout")
				get_tree().change_scene("res://Scenes/S"+G.current_level+"/S"+G.current_level+".tscn")
			else:
				G.current_level="1"
				player.playing=false
				G.safe_data()
				yield(get_tree().create_timer(0.3),"timeout")
				get_tree().change_scene("res://Scenes/S1/S1.tscn")
		

func _on_button_back_pressed():
	if G.click:
		G.safe_data()
		player.playing=false
		yield(get_tree().create_timer(0.3),"timeout")
		get_tree().change_scene("res://Scenes/Main/Main.tscn")

func _on_button_add_pressed():
	if G.click:
		$ui/button_add.disabled=true
		G.score-=G.mass_add[0]
		$ui/score.text=str(G.score)
		if(len(G.mass_add)>1):
			G.mass_add.pop_front()
		if G.lang=="ru":
			$ui/label_add.text=str(G.mass_add[0])+"\n"+"клик +1"
		else:
			$ui/label_add.text=str(G.mass_add[0])+"\n"+"click +1"
		G.step+=1

var time=2
func _on_Timer_timeout():
	time-=1
	if time>0:
		if G.lang=="ru":
			$rekl/Label.text="Реклама через "+str(time)
		else:
			$rekl/Label.text="Advertising through "+str(time)
		$rekl/Timer.start()
	else:
		G.js_show_ad()
		get_tree().paused=true
		$rekl.visible=false
		G.timer=65
		$rekl/T.start()
	
func _on_T_timeout():
	G.timer-=1
	if G.timer<1:
		G.click=false
		player.playing=false
		$rekl.visible=true
		time=2
		$rekl/Label.text="Реклама через "+str(time)
		$rekl/Timer.start()
	else:
		$rekl/T.start()
	
func _on_TimerSafe_timeout():
	G.safe_data()
	flag_safe=true
