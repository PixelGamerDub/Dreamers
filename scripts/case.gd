extends Button
class_name Case

# Accès aux noeuds enfants de Case
@onready var stateMachine = $StateMachine
@onready var animatedSprite = $AnimatedSprite2D
@onready var age = 0

# Quand on clique sur la case
func _on_pressed() -> void: 
	# Décider un move aléatoire (à déplacer dans GameManager.gd)
	var move : String
	var rand := randf()
	
	if rand < 0.333:
		move = Constantes.MOVE_X
	elif rand < 0.666:
		move = Constantes.MOVE_O
	elif rand < 1:
		move = Constantes.MOVE_FISSURE
	
	stateMachine.changerEtat(move)
	animatedSprite.play(stateMachine.etatActuel.cleAnimation)
	verifierVictoire()

func etatActuel():
	return stateMachine.etatActuel

func getEtat(nomEtat : String) -> StateCase:
	return stateMachine.etats[nomEtat]

func verifierVictoire():
	# Façon TEMPORAIRE (très nulle) de vérifier si quelqu'un a gagné
	
	if verifierLigne("ligne1"):
		print("Gagné avec ligne 1")
		return
	
	if verifierLigne("ligne2"):
		print("Gagné avec ligne 2")
		return
		
	if verifierLigne("ligne3"):
		print("Gagné avec ligne 3")
		return
	
	if verifierLigne("colonne1"):
		print("Gagné avec colonne 1")
		return
		
	if verifierLigne("colonne2"):
		print("Gagné avec colonne 2")
		return
	
	if verifierLigne("colonne3"):
		print("Gagné avec colonne 3")
		return
	
	if verifierLigne("diagonale1"):
		print("Gagné avec diagonale 1")
		return
		
	if verifierLigne("diagonale2"):
		print("Gagné avec diagonale 2")
		return

func verifierLigne(groupe : String) -> bool:
	var cases = get_tree().get_nodes_in_group(groupe)
	var casesEgales = cases[0].etatActuel().cleAnimation == cases[1].etatActuel().cleAnimation and cases[1].etatActuel().cleAnimation == cases[2].etatActuel().cleAnimation 
	var estSymbole = cases[0].etatActuel() is OState or cases[0].etatActuel() is XState
	
	return casesEgales and estSymbole
	
