extends StateTour
class_name TourOState

func _ready():
	symbole = "O"
	adversaire = StateTour.ETAT_TOUR_X

func entrer():
	print("Au tour de O")
	# Plus tard : changer une icône à l'écran pour indiquer le tour
	pass

func sortir():
	pass

func transitionSelon(_move: String) -> String:
	return adversaire
