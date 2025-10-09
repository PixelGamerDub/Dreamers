extends Button

@export var nom := "case"

@onready var symbole := $Symbole

func _on_pressed() -> void:
	print("On a appuyé sur ", nom, " !")
	symbole.visible = true
	pass # Replace with function body.
