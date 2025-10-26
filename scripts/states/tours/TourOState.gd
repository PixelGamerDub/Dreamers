extends StateTour
class_name TourOState

func _ready():
	monMove = Constantes.MOVE_O
	moveAdverse = Constantes.MOVE_X

func entrer():
	print("Au tour de O")
	# Plus tard : changer une icône à l'écran pour indiquer le tour
	pass

func sortir():
	pass

func transitionSelon(_move: String) -> String:
	return StateTour.ETAT_TOUR_X
