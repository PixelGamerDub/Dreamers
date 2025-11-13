extends Node

@onready var button_1: Button = %Button
@onready var button_2: Button = %Button2
@onready var button_3: Button = %Button3
@onready var descriptionPowerUp: Label = %DescriptionPowerUp
@onready var buttonChoix = [button_1, button_2, button_3]
var boutonPowerUp = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var powerups = PowerUp.listePowerUpsMineurs()
	
	for bouton in buttonChoix:
		var powerupChoisi = powerups.pick_random()
		powerups.erase(powerupChoisi)
		bouton.text = powerupChoisi.nom
		boutonPowerUp[bouton] = powerupChoisi
	

func _on_button_focus_entered(bouton) -> void:
	descriptionPowerUp.text = boutonPowerUp[bouton].description
