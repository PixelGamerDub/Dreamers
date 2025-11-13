extends Node2D

@onready var button_1: Button = $Button
@onready var button_2: Button = $Button2
@onready var button_3: Button = $Button3

@onready var buttonChoix = [button_1, button_2, button_3]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var powerups = ["Explosion", "Vol", "Garantie", "Malédiction"]
	var powerupChoisi
	for bouton in buttonChoix :
		powerupChoisi = powerups.pick_random()
		powerups.erase(powerupChoisi)
		bouton.text = powerupChoisi
		
	
	
	
