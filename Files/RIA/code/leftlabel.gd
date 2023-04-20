extends Label

var nav

func changetext():
	var image=nav.get('imagename').replace('_','\n').replace('.jpg','').replace('-',' ')
	self.set_text(image)

func _ready():
	nav=get_node('/root/Main/ImageNav')
	nav.connect('pagechange',self,'changetext')
	changetext()

func _on_ImageLoad_dir_selected(_dir):
	changetext()

func _on_pageleft_pressed():
	changetext()

func _on_pageright_pressed():
	changetext()
