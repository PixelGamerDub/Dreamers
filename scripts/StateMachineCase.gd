extends Node
class_name StateMachine

var etatInitial : State
var etatActuel : State

func _ready() :
	etatInitial.entrer()
	
func changerEtat(_move : String):
	pass
	
func forcerEtat(_etat : State):
	pass
