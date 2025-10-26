extends StateManche
class_name Manche1State

func _ready():
	dimension = 3
	nbCoupsMax = dimension + 1
	borne1 = 0.50
	borne2 = 0.89
	cleAnimation = StateManche.ETAT_MANCHE_1

func entrer():
	print("Début de la manche 1")
	# Plus tard : jouer l'animation de début de manche
	pass

func sortir():
	print("Fin de la manche 1")
	# Plus tard : jouer l'animation de fin de manche
	pass

func transitionSelon(_move: String) -> String:
	return StateManche.ETAT_MANCHE_2
