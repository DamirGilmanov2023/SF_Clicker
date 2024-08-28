extends Node

var S={"S1_life":10,
	"S2_life":10,
	"S3_life":10,
	"S4_life":10,
	"S5_life":10,
	"S6_life":10,
	"S7_life":10,
	"S8_life":10,
	"S9_life":10,
	"S10_life":10,
	"S11_life":10,
	"S12_life":10,
	"S13_life":10,
	"S14_life":10,
	"S15_life":10,
	"S16_life":10,
	"S17_life":10,
	"S18_life":10,
	
	"S1_max_life":300,
	"S2_max_life":500,
	"S3_max_life":800,
	"S4_max_life":1000,
	"S5_max_life":1200,
	"S6_max_life":1500,
	"S7_max_life":1800,
	"S8_max_life":2000,
	"S9_max_life":2200,
	"S10_max_life":2400,
	"S11_max_life":2400,
	"S12_max_life":2400,
	"S13_max_life":2400,
	"S14_max_life":2400,
	"S15_max_life":2400,
	"S16_max_life":2400,
	"S17_max_life":2400,
	"S18_max_life":2400,
	
	"S1":false

	}

var step:int=1

var score:int=0

var mass_add=[100,300,500,1000,2000,3000,5000]

var current_level

func _ready():
	for i in range(2,19):
		S["S"+str(i)]=true

