extends Node

@onready var ui_inventory = get_tree().root.get_node("trashhunt/InventoryUI")

var inventory_open = false
var items: Array = []

func add_item(item_name: String):
	items.append(item_name)
	print("Inventory:", items)
	
	# Update UI hanya kalau inventory sedang dibuka
	if inventory_open:
		ui_inventory.show_inventory(items)

func remove_item(item_name: String) -> bool:
	if item_name in items:
		items.erase(item_name)
		print("Item dihapus dari inventory:", item_name)

		# Refresh UI kalau sedang dibuka
		if inventory_open:
			ui_inventory.show_inventory(items)

		return true
	return false

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		inventory_open = !inventory_open

		if inventory_open:
				ui_inventory.show_inventory(items)
		else:
			ui_inventory.hide_inventory()
