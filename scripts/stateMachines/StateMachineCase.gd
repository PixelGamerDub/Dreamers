extends StateMachine
class_name StateMachineCase

@onready var etats = {
	StateCase.ETAT_VIDE: 	$VideState,
	StateCase.ETAT_FISSURE:	$FissureState,
	StateCase.ETAT_DETRUIT:	$DetruitState,
	StateCase.ETAT_REGEN:	$RegenState,
	StateCase.ETAT_O:		$OState,
	StateCase.ETAT_X:		$XState,
	"": 					null
}

func _ready() :
	etatInitial = etats[StateCase.ETAT_VIDE]
	etatActuel = etatInitial
	etatInitial.entrer()
	
func changerEtat(move : String) -> bool:
	var prochainEtat = etats[etatActuel.transitionSelon(move)]
	
	# Si le move effectué ne mène à aucun état, le tour n'est pas validé
	if prochainEtat == null:
		print("Transition impossible")
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
