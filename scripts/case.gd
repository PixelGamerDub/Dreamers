extends Button
class_name Case

# Accès aux noeuds enfants de Case
@onready var state_machine = $StateMachine

func _on_pressed() -> void: #quand la case est clique
	state_machine.changerEtat(Constantes.MOVE_X)
