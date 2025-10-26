extends StateManche
class_name Manche3State

func _ready():
	dimension = 5
	nbCoupsMax = dimension + 1
	
	# À CHANGER
	borne1 = 0.50 
	borne2 = 0.89
	
	cleAnimation = StateManche.ETAT_MANCHE_3

func entrer():
	print("Début de la manche 3")
	# Jouer l'animation de début de manche
	pass

func sortir():
	print("Fin de la manche 3")
	# Jouer l'animation de fin de la manche
	# Transition vers la scène suivante
	pass

func transitionSelon(_move: String) -> String:
	return StateManche.ETAT_MANCHE_3
