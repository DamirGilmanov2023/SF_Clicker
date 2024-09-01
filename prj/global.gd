extends Node

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
