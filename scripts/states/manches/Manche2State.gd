extends StateManche
class_name Manche2State

func _ready():
	numero = 2
	powerUpPresents=true
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

# Cette fonction renvoie le joueur qui a gagné la manche ou NULL si personne n'a gagné
func verifierConditionsVictoire() -> String:
	var gagnant := ""
	var l := 1
	var c := 1
	var d := 1
	
	while l <= dimension and gagnant == "":
		gagnant = verifierAlignement("ligne" + str(l) + "g")
		l += 1
		
	while c <= dimension and gagnant == "":
		gagnant = verifierAlignement("colonne" + str(c) + "g")
		c += 1
	
	while d <= 2 and gagnant == "":
		gagnant = verifierAlignement("diagonale" + str(d) + "g")
		d += 1
	
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
