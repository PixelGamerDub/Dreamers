extends StateManche
class_name Manche2State

func _ready():
	dimension = 4
	nbCoupsMax = dimension + 1
	
	# À CHANGER
	borne1 = 0.50 
	borne2 = 0.89
	
	cleAnimation = StateManche.ETAT_MANCHE_2

func entrer():
	print("Début de la manche 2")
	pass

func sortir():
	print("Fin de la manche 2")
	pass

func transitionSelon(_move: String) -> String:
	return StateManche.ETAT_MANCHE_3
