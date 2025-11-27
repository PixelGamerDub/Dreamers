extends PowerUpMineur
class_name Malediction

<<<<<<< Updated upstream
func _init():
	nom = "Malediction"
	description = "Le prochain coup du joueur ennemi ne peut pas jouer son symbole"
=======
func _ready() -> void:
	nom = "Malediction"
	description = "l'adversaire ne peut pas mettre son symbole le prochain tour"
>>>>>>> Stashed changes
	dureeAction = 1
