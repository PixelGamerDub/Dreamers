extends State
class_name StateTour

static var ETAT_TOUR_X := "E_TOUR_X"
static var ETAT_TOUR_O := "E_TOUR_O"

var symbole : String
var adversaire : String

func entrer():
	pass

func sortir():
	pass

func transitionSelon(_move: String) -> String:
	return ""
