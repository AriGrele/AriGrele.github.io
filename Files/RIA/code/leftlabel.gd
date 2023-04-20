extends Label

var nav

func changetext():
	var image=nav.get('imagename').replace('_','\n').replace('.jpg','').replace('-',' ')
	self.set_text(image)

func _ready():pass
