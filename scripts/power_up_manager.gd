extends Node

@onready var boutonJeton1: Button = %BoutonJeton1
@onready var boutonJeton2: Button = %BoutonJeton2
@onready var boutonJeton3: Button = %BoutonJeton3
@onready var descriptionPowerUp: Label = %DescriptionPowerUp
@onready var boutonChoix: Button = %BoutonChoix
@onready var boutonsJeton := [boutonJeton1, boutonJeton2, boutonJeton3]
@onready var selecteur = StateTour.ETAT_TOUR_O if GameManagerScript.partie[GameManagerScript.mancheActuelle().numero]["gagnant"] == StateTour.ETAT_TOUR_X else StateTour.ETAT_TOUR_X 

var boutonPowerUp = {}
var jetonSelectionne

func _ready() -> void:
	print(GameManagerScript.partie[GameManagerScript.mancheActuelle().numero]["gagnant"])
	var powerups = PowerUp.listePowerUpsMineurs()
	
	for bouton in boutonsJeton:
		var powerupChoisi = powerups.pick_random()
		powerups.erase(powerupChoisi)
		bouton.text = powerupChoisi.nom
		boutonPowerUp[bouton] = powerupChoisi

func _on_button_focus_entered(bouton) -> void:
	descriptionPowerUp.text = boutonPowerUp[bouton].description
	jetonSelectionne = boutonPowerUp[bouton]
	boutonChoix.disabled = false


func _on_bouton_choix_pressed() -> void:
	pass # Replace with function body.
