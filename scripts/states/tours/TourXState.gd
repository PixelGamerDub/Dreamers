extends StateTour
class_name TourXState

func _ready():
	symbole = "X"
	adversaire = StateTour.ETAT_TOUR_O

func entrer():
	print("Au tour de X")
	# Plus tard : changer une icône à l'écran pour indiquer le tour
	pass

func sortir():
	pass

func transitionSelon(_move: String) -> String:
	return adversaire
