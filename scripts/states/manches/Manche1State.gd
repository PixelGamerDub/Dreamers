extends StateManche
class_name Manche1State



func _ready():
	dimension = 3
	nbCoupsMax = dimension + 1
	borne1 = 0.50
	borne2 = 0.89
	cleAnimation = StateManche.ETAT_MANCHE_1

func entrer():
	print("Début de la manche 1")
	pass

func sortir():
	print("Fin de la manche 1")
	pass

func transitionSelon(_move: String) -> String:
	return StateManche.ETAT_MANCHE_2

# Cette fonction renvoie le joueur qui a gagné la manche ou NULL si personne n'a gagné
func verifierConditionsVictoire() -> StateTour:
	var gagnant : StateTour = null
	var l := 1
	var c := 1
	var d := 1
	
	while l <= dimension and gagnant == null:
		gagnant = verifierAlignement("ligne" + str(l))
		
	while c <= dimension and gagnant == null:
		gagnant = verifierAlignement("colonne" + str(c))
	
	while d <= 2 and gagnant == null:
		gagnant = verifierAlignement("diagonale" + str(d))
	
	return gagnant

func verifierAlignement(groupe : String) -> StateTour:
	var cases = get_tree().get_nodes_in_group(groupe)
	var gagnant : StateTour = null

	var i := 0
	
	while i < len(cases) and :
		continue
	
	
	return null
