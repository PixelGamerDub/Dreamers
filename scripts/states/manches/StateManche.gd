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
func verifierConditionsVictoire() -> String:
	var gagnant := ""
	var l := 1
	var c := 1
	var d := 1
	
	while l <= dimension and gagnant == "":
		gagnant = verifierAlignement("ligne" + str(l))
		
	while c <= dimension and gagnant == "":
		gagnant = verifierAlignement("colonne" + str(c))
	
	while d <= 2 and gagnant == "":
		gagnant = verifierAlignement("diagonale" + str(d))
	
	return gagnant

# Renvoie le joueur gagnant si la ligne/colonne/diagonale a été remportée par un joueur, sinon une chaine vide
func verifierAlignement(groupe : String) -> String:
	var cases = get_tree().get_nodes_in_group(groupe)
	var symbolesEgaux := true

	var i := 1
	
	while i < dimension and symbolesEgaux:
		symbolesEgaux = cases[i].symbolesEgaux(cases[i-1])
		i += 1
	
	if symbolesEgaux:
		match(cases[0].etatActuel().cleAnimation):
			StateCase.ETAT_X:
				return StateTour.ETAT_TOUR_X
			StateCase.ETAT_O:
				return StateTour.ETAT_TOUR_O
	
	return ""
