extends ColorRect

var pos
var vpos
var uv
var mat
var panel
var nav

func toggle():
	if self.is_visible():
		hide()
	else:show()

func _ready():
	self.hide()
	nav=get_node('/root/Main/ImageNav/')
	nav.connect('togglezoom',self,'toggle')
	
	pos=Vector2(0,0)
	vpos=Vector2(0,0)
	uv=0
	mat=self.get_material()
	panel=self.get_parent()
	
func _process(_delta):
	pos=get_global_mouse_position()-Vector2(128,128)-panel.get_position()
	vpos=get_viewport().get_mouse_position()
	var window=get_viewport_rect().size
	
	var off=(window.y-512)/2
	window.x=vpos.x-window.x
	window.y=vpos.y-window.y+off
	
	uv=Vector2(1.0,1.0)-window/-485.0
	uv.x=clamp(uv.x,.1,.9)
	uv.y=clamp(uv.y,.1,.9)
	
	mat.set_shader_param("pos",uv)
	
	self.set_position(pos)
