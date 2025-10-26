extends State
class_name StateManche

static var ETAT_MANCHE_1 := "E_MANCHE_1"
static var ETAT_MANCHE_2 := "E_MANCHE_2"
static var ETAT_MANCHE_3 := "E_MANCHE_3"

var dimension : int
var nbCoupsMax : int
var borne1 : float
var borne2 : float

var cleAnimation : String

func entrer():
	# Plus tard : lancer l'animation de la manche
	pass

func sortir():
	pass

func transitionSelon(_move: String) -> String:
	return ""

# Cette fonction renvoie le joueur qui a gagné la manche ou NULL si personne n'a gagné
func verifierConditionsVictoire() -> StateTour:
	return null
