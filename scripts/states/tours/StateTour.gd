extends State
class_name StateTour

static var ETAT_TOUR_X := "E_TOUR_X"
static var ETAT_TOUR_O := "E_TOUR_O"
static var ETAT_GROUPE_X := "E_GROUPE_X"
static var ETAT_GROUPE_O := "E_GROUPE_O"

var monMove : String
var moveAdverse : String
var monGroupe : String
var groupeAdverse : String

func entrer():
	pass

func sortir():
	pass

func transitionSelon(_move: String) -> String:
	return ""
