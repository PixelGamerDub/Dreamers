extends Node

@onready var boutonJeton1: Button = %BoutonJeton1
@onready var boutonJeton2: Button = %BoutonJeton2
@onready var boutonJeton3: Button = %BoutonJeton3
@onready var descriptionPowerUp: Label = %DescriptionPowerUp
@onready var boutonChoix: Button = %BoutonChoix
@onready var boutonsJeton := [boutonJeton1, boutonJeton2, boutonJeton3]
@onready var gagnant = GameManagerScript.partie[GameManagerScript.mancheActuelle().numero - 1]["gagnant"]
@onready var selecteur = StateTour.ETAT_TOUR_O if gagnant == StateTour.ETAT_TOUR_X else StateTour.ETAT_TOUR_X 

var boutonPowerUp = {}
var jetonSelectionne: PowerUp
var boutonSelectionne: Button

func _ready() -> void:
	print("Au joueur X de choisir" if selecteur == StateTour.ETAT_TOUR_X else "Au joueur O de choisir")
	var powerups = PowerUp.listePowerUpsMineurs()
	
	for bouton in boutonsJeton:
		var powerupChoisi = powerups.pick_random()
		powerups.erase(powerupChoisi)
		bouton.text = powerupChoisi.nom
		boutonPowerUp[bouton] = powerupChoisi

func _on_button_focus_entered(bouton) -> void:
	if bouton.disabled:
		jetonSelectionne = null
		boutonSelectionne = null
		return
	
	descriptionPowerUp.text = boutonPowerUp[bouton].description
	jetonSelectionne = boutonPowerUp[bouton]
	boutonSelectionne = bouton
	boutonChoix.disabled = false


func _on_bouton_choix_pressed() -> void:
	if not boutonSelectionne:
		return
	
	boutonSelectionne.disabled = true
	GameManagerScript.partie[GameManagerScript.mancheActuelle().numero]["powerups"][selecteur].append(jetonSelectionne) 
	
	if selecteur == gagnant:
		get_tree().change_scene_to_file("res://scenes/Manche" + str(GameManagerScript.mancheActuelle().numero) + ".tscn")
	else:
		selecteur = gagnant
		print("Au joueur X de choisir" if gagnant == StateTour.ETAT_TOUR_X else "Au joueur O de choisir")
