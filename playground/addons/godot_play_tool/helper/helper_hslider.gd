extends HSlider

### Summary #####################################################
#
# + 2024.09.18 by R
#
# @tool 옵션을 켜고 @export title : String에 set property를 사용하는 경우 애매하게 작동한다.
# 현 시점에서 자식 Label에 editor 단계에서 정상적으로 값을 전해줄 방법이 없다.
#
# editor의 scene tree에서 이 타입 노드를 선택하고 "편집할 수 있는 자식" 옵션을 활성화 하면 자식노드에 접근 가능하다.
# 그 방법으로 Title Label의 text를 변경해라.
#
#################################################################



### Node : Override #############################################
func _ready()->void:
	_on_value_changed( self.value )



### Signal Function #############################################
func _on_value_changed( value : float )->void:
	$Value.text = str( value )
