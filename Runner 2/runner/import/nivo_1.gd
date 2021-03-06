extends RigidBody2D
var speed = 500
var direction = Vector2() 
var width
var height
var jump= 50
var gravity = 40
var ground_collision = 1
var right_air = 0
var left_air = 0

func _ready():
    width = get_viewport_rect().size.x   
    height = get_viewport_rect().size.y
    position.y = 0
    position.x = width / 2 #place position au milieu de l'ecran

func _process(delta):
	gravity *= 1.08
	jump *= 0.935
	position.y += gravity * delta
	position.y += -jump * delta
	
	if position.y > height/1.5:
		gravity = 0
		jump = 0
		ground_collision = 1
		
    
func _physics_process(delta):
	
	
	if Input.is_action_pressed("ui_up") and ground_collision == 1:
		ground_collision = 0
		gravity = 40
		jump=1500
	
		
	if Input.is_action_pressed("ui_right") and ground_collision == 1 :
		position.x += 5
		
	if Input.is_action_pressed("ui_left") and ground_collision == 1 :
		position.x += -5
		# Fait truc inertie, variable gauche quand appui et droite ki gravité& coté et quznd touche sol, gravité 0