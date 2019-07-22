extends Area2D

export (int) var Velocidad
var Movimiento = Vector2()
var limite


func _ready():
	limite = get_viewport_rect().size
	


func _process(delta):
	Movimiento = Vector2() #Reiniciar los movimientos
	
	if Input.is_action_pressed("ui_right") : # Derecha
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"): # Izquierda
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_up"): # Arriba
		Movimiento.y -= 1
	if Input.is_action_pressed("ui_down"): # Abajo
		Movimiento.y +=1
		
	if Movimiento.length() > 0: #Verificar si se esta movimiendo
		Movimiento = Movimiento.normalized() * Velocidad #Normalizar la velocidad
		
	position += Movimiento * delta #Actualizar los movimientos
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	
	
	
	if Movimiento.x != 0:
		$Sprite_playerA.animation = "lado"
		$Sprite_playerA.flip_h = Movimiento.x < 0
		$Sprite_playerA.flip_v = false
	elif Movimiento.y != 0:
		$Sprite_playerA.animation = "espalda"
		$Sprite_playerA.flip_v = Movimiento.y > 0
	else:
		$Sprite_playerA.animation = "frente"