extends Button
class_name Case

# Accès aux noeuds enfants de Case
@onready var state_machine = $StateMachine

func _on_pressed() -> void: #quand la case est clique
	state_machine.forcerEtat(getEtat(StateCase.ETAT_DETRUIT))

func getEtat(nom_etat : String) -> StateCase:
	return state_machine.etats[nom_etat]
	
