extends StateTour
class_name TourXState

func _ready():
	monMove = Constantes.MOVE_X
	moveAdverse = Constantes.MOVE_O

func entrer():
	print("Au tour de X")
	signal ajouterAuGroupe(monMove)
	# Plus tard : changer une icône à l'écran pour indiquer le tour
	pass

func sortir():
	pass

func transitionSelon(_move: String) -> String:
	return StateTour.ETAT_TOUR_O
