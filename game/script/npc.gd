extends Node2D

var player_in_range = false
var dialog = [
	"Halo! bro tolongambilkan sampah disekitar sini ya lingkungan kita sudah tercemar.",
]
@onready var ui = get_tree().root.get_node("trashhunt/UI")
@onready var dialog_ui = get_tree().root.get_node("trashhunt/DialogUI")  # GANTI sesuai path UI kamu
var dialog_index = 0


func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)


func _on_body_entered(body):
	if body.name == "player":
		player_in_range = true
		ui.show_dialog_text()
		print("Player masuk area NPC")


func _on_body_exited(body):
	if body.name == "player":
		player_in_range = false
		ui.hide_dialog_text()
		print("Player keluar area NPC")


func _process(delta):
	# Tekan E saat dekat NPC
	if player_in_range and Input.is_action_just_pressed("interact"):
		ui.hide_dialog_text()
		start_dialog()

func start_dialog():
	if dialog_ui == null:
		print("ERROR: Dialog UI tidak ditemukan!")
		return

	dialog_ui.show_dialog(dialog)
