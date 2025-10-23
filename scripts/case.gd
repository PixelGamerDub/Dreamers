extends Button
class_name Case

# Accès aux noeuds enfants de Case
@onready var symbole= $croix
@onready var StateMachine=$StateMachine
@export var etat:State
var move=Constantes.FRAGILE


func _on_pressed() -> void: #quand la case est clique
	symbole.visible = true #on affiche la croix
	if not etat.jouable:
		print('Pas jouable')
