extends PowerUpMineur
class_name Malediction


func _init():
	nom = "Malediction"
	description = "Le prochain coup du joueur ennemi ne peut pas jouer son symbole"

func _ready() -> void:
	nom = "Malediction"
	description = "l'adversaire ne peut pas mettre son symbole le prochain tour"

	dureeAction = 1
