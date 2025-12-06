extends CanvasLayer

@onready var panel = $Panel
@onready var list_container = $Panel/VBoxContainer

func show_inventory(items):
	visible = true
	
	# bersihkan isi UI
	for child in list_container.get_children():
		child.queue_free()

	# isi ulang UI berdasarkan inventory
	for item in items:
		var label = Label.new()
		label.text = str(item)
		list_container.add_child(label)

func hide_inventory():
	visible = false
