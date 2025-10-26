extends  State
class_name StateCase

static var ETAT_VIDE:= "E_VIDE"
static var ETAT_FISSURE:= "E_FISSURE"
static var ETAT_DETRUIT:= "E_DETRUIT"
static var ETAT_REGEN:= "E_REGEN"
static var ETAT_X:= "E_X"
static var ETAT_O:= "E_O"


var jouable : bool
var cleAnimation : String

func entrer():
	# Plus tard : lancer l'animation
	pass

func sortir():
	pass

func transitionSelon(_move: String) -> String:
	return ""
