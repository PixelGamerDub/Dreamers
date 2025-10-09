extends Button
class_name Case
@export var nom := "case"

@onready var symbole := $Symbole

func _on_pressed() -> void:
	print("On a appuyé sur ", nom, " !")
	symbole.visible = true
	
	var tab = [0, 1, 2, 3]
	
	for i in range(4):
		print(tab[i])
	
	pass # Replace with function body.

func additionner(n1, n2):
	return n1 + n2
