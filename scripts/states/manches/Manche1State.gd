extends StateManche
class_name Manche1State

func _ready():
	numero = 1
	dimension = 3
	nbCoupsMax = dimension + 1
	borne1 = 0.50 # Remplacer cette valeur par 1 pour retirer l'aléatoire
	borne2 = 0.89
	cleAnimation = StateManche.ETAT_MANCHE_1

func entrer():
	print("Début de la manche 1")
	# Plus tard : jouer l'animation de début de manche
	pass

func sortir():
	print("Fin de la manche 1")
	# Plus tard : jouer l'animation de fin de manche
	pass

func transitionSelon(_move: String) -> String:
	return StateManche.ETAT_MANCHE_2

# Cette fonction renvoie le joueur qui a gagné la manche ou NULL si personne n'a gagné
func verifierConditionsVictoire() -> String:
	var gagnant := ""
	var l := 1
	var c := 1
	var d := 1
	
	while l <= dimension and gagnant == "":
		gagnant = verifierAlignement("ligne" + str(l))
		l += 1
		
	while c <= dimension and gagnant == "":
		gagnant = verifierAlignement("colonne" + str(c))
		c += 1
	
	while d <= 2 and gagnant == "":
		gagnant = verifierAlignement("diagonale" + str(d))
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
