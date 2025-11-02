extends StateMachine
class_name StateMachineManche

@onready var etats = {
	StateManche.ETAT_MANCHE_1:	$Manche1State,
	StateManche.ETAT_MANCHE_2:	$Manche2State,
	StateManche.ETAT_MANCHE_3:	$Manche3State,
	"": 						null
}

func _ready():
	etatInitial = etats[StateManche.ETAT_MANCHE_1]
	etatActuel = etatInitial
	etatInitial.entrer()
	
func changerEtat(_move : String) -> bool:
	var prochainEtat = etats[etatActuel.transitionSelon(_move)]
	
	# Si le move effectué ne mène à aucun état, ne rien faire
	if prochainEtat == null:
		return false
	
	# Transition à l'état suivant
	etatActuel.sortir()
	etatActuel = prochainEtat
	etatActuel.entrer()
	
	return true
	
func forcerEtat(etat : State):
	# Si on est déjà dans cet état, ne rien faire
	if etatActuel == etat:
		return
	
	etatActuel.sortir()
	etatActuel = etat
	etatActuel.entrer()
