extends Node

var game_start=true

var click=true

var S={"S1_life":100,
	"S2_life":200,
	"S3_life":300,
	"S4_life":400,
	"S5_life":500,
	"S6_life":600,
	"S7_life":700,
	"S8_life":800,
	"S9_life":900,
	"S10_life":1000,
	"S11_life":1100,
	"S12_life":1200,
	"S13_life":1300,
	"S14_life":1400,
	"S15_life":1500,
	"S16_life":1600,
	"S17_life":1700,
	"S18_life":1800,
	
	"S1_max_life":100,
	"S2_max_life":200,
	"S3_max_life":300,
	"S4_max_life":400,
	"S5_max_life":500,
	"S6_max_life":600,
	"S7_max_life":700,
	"S8_max_life":800,
	"S9_max_life":900,
	"S10_max_life":1000,
	"S11_max_life":1100,
	"S12_max_life":1200,
	"S13_max_life":1300,
	"S14_max_life":1400,
	"S15_max_life":1500,
	"S16_max_life":1600,
	"S17_max_life":1700,
	"S18_max_life":1800,
	
	"S1":false

	}

var step:int=1

var score:int=0

var mass_add=[90,190,290,390,490,590,690,790,890,990,1090,1190,1290,1390,1490,1590,1690,1790,1800]

var current_level

func _ready():
	for i in range(2,19):
		S["S"+str(i)]=true

var timer=65

#-------------------------------------------------------------------------------

func safe_data():
	var value:String
	value+=str(S["S1_life"])+","+str(S["S2_life"])+","+str(S["S3_life"])+","+str(S["S4_life"])+","
	value+=str(S["S5_life"])+","+str(S["S6_life"])+","+str(S["S7_life"])+","+str(S["S8_life"])+","
	value+=str(S["S9_life"])+","+str(S["S10_life"])+","+str(S["S11_life"])+","+str(S["S12_life"])+","
	value+=str(S["S13_life"])+","+str(S["S14_life"])+","+str(S["S15_life"])+","+str(S["S16_life"])+","
	value+=str(S["S17_life"])+","+str(S["S18_life"])+";"
	
	value+=str(S["S1_max_life"])+","+str(S["S2_max_life"])+","+str(S["S3_max_life"])+","+str(S["S4_max_life"])+","
	value+=str(S["S5_max_life"])+","+str(S["S6_max_life"])+","+str(S["S7_max_life"])+","+str(S["S8_max_life"])+","
	value+=str(S["S9_max_life"])+","+str(S["S10_max_life"])+","+str(S["S11_max_life"])+","+str(S["S12_max_life"])+","
	value+=str(S["S13_max_life"])+","+str(S["S14_max_life"])+","+str(S["S15_max_life"])+","+str(S["S16_max_life"])+","
	value+=str(S["S17_max_life"])+","+str(S["S18_max_life"])+";"
	
	value+="1," if S["S1"] else "0,"
	value+="1," if S["S2"] else "0,"
	value+="1," if S["S3"] else "0,"
	value+="1," if S["S4"] else "0,"
	value+="1," if S["S5"] else "0,"
	value+="1," if S["S6"] else "0,"
	value+="1," if S["S7"] else "0,"
	value+="1," if S["S8"] else "0,"
	value+="1," if S["S9"] else "0,"
	value+="1," if S["S10"] else "0,"
	value+="1," if S["S11"] else "0,"
	value+="1," if S["S12"] else "0,"
	value+="1," if S["S13"] else "0,"
	value+="1," if S["S14"] else "0,"
	value+="1," if S["S15"] else "0,"
	value+="1," if S["S16"] else "0,"
	value+="1," if S["S17"] else "0,"
	value+="1;" if S["S18"] else "0;"
	
	value+=str(step)+";"
	
	value+=str(score)+";"
	
	var i=0
	while i<len(mass_add):
		value+=str(mass_add[i])+","
		i+=1
	value=value.substr(0,value.length()-1)
	
	js_set_data(value)
#-------------------------------------------------------------------------------
onready var win = JavaScript.get_interface("window")
#-------------------------------------------------------------------------------
signal ad(value)
var callback_ad = JavaScript.create_callback(self, '_ad')
func js_show_ad():
	win.ShowAd(callback_ad)

func _ad(args):
	emit_signal("ad",args[0])
#-------------------------------------------------------------------------------
signal foc_unfoc(value)
var callback_foc_unfoc=JavaScript.create_callback(self, '_foc_unfoc')

func js_foc_unfoc():
	win.foc_unfoc(callback_foc_unfoc)

func _foc_unfoc(args):
	emit_signal("foc_unfoc",args[0])
#-------------------------------------------------------------------------------
var callback_get_data=JavaScript.create_callback(self,'_get_data')

func js_get_data():
	win.get_data(callback_get_data)

func _get_data(args):
	var value=args[0]
	if value!="Null":
		var v=value.split(";")
		var life=v[0].split(",")
		var maxx=v[1].split(",")
		var disabled=v[2].split(",")
		var sstep=v[3]
		var sscore=v[4]
		var smass_add=v[5].split(",")
		var i=0
		while i<18:
			S["S"+str(i+1)+"_life"]=int(life[i])
			S["S"+str(i+1)+"_max_life"]=int(maxx[i])
			S["S"+str(i+1)]=true if int(disabled[i])==1 else false 
			i+=1

		step=int(sstep)
		
		score=int(sscore)
		
		mass_add.clear()
		i=0
		while i<len(smass_add):
			if int(smass_add[i])!=0:
				mass_add.append(int(smass_add[i]))
			i+=1
#-------------------------------------------------------------------------------
func js_set_data(value):
	win.set_data(value)
#-------------------------------------------------------------------------------
func js_game_ready_api():
	win.GameReadyApi()
#-------------------------------------------------------------------------------
var lang="ru"
func get_lang():
	win.GetLang()
	yield(get_tree().create_timer(0.5),"timeout")
	lang=win.game_lang;
