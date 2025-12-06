extends Area2D

@onready var inventory = get_tree().get_current_scene().get_node("InventoryManager")
var player_in_range = false

# Tambahkan variabel untuk menghitung sampah yang sudah dibuang
var trash_collected = 0
var trash_target = 5  # target jumlah sampah untuk level complete

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.name == "player":
		player_in_range = true
		print("Dekat trashbin, tekan E untuk membuang item")

func _on_body_exited(body):
	if body.name == "player":
		player_in_range = false

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		if inventory.items.size() > 0:
			var item_name = inventory.items[0]
			inventory.remove_item(item_name)
			trash_collected += 1  # tambah counter
			print("Item dibuang ke trashbin:", item_name, "Total dibuang:", trash_collected)
			
			# cek apakah sudah mencapai target
			if trash_collected >= trash_target:
				print("Level selesai! Menuju Level Complete")
				get_tree().change_scene_to_file("res://scene/levelcomplete.tscn")  # ganti path sesuai scene kamu
		else:
			print("Inventory kosong")

#extends Area2D
#
#@onready var inventory = get_tree().get_current_scene().get_node("InventoryManager")
#var player_in_range = false
#
#func _ready():
	#body_entered.connect(_on_body_entered)
	#body_exited.connect(_on_body_exited)
#
#func _on_body_entered(body):
	#if body.name == "player":
		#player_in_range = true
		#print("Dekat trashbin, tekan E untuk membuang item")
#
#func _on_body_exited(body):
	#if body.name == "player":
		#player_in_range = false
#
#func _process(delta):
	#if player_in_range and Input.is_action_just_pressed("interact"):
		#if inventory.items.size() > 0:
			#var item_name = inventory.items[0]
			#inventory.remove_item(item_name)
			#print("Item dibuang ke trashbin:", item_name)
		#else:
			#print("Inventory kosong")
