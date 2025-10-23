extends StateMachine
class_name StateMachineCase

@onready var etats = {
	StateCase.ETAT_VIDE: 	$VideState,
	StateCase.ETAT_FISSURE:	$FissureState,
	StateCase.ETAT_DETRUIT:	$DetruitState,
	StateCase.ETAT_REGEN:	$RegenState,
	StateCase.ETAT_O:		$OState,
	StateCase.ETAT_X:		$XState
}

func _init():
	etatInitial = $VideState
	etatActuel = etatInitial
	
func _ready() :
	etatInitial.entrer()
	
func changerEtat(move : String):
	if etatActuel.jouable :
	#Reprendre ici
func forcerEtat(_etat : State):
	pass
