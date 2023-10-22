import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultSearchField extends StatefulWidget {
  const DefaultSearchField({super.key});

  @override
  State<DefaultSearchField> createState() => _DefaultSearchFieldState();
}

class _DefaultSearchFieldState extends State<DefaultSearchField> {
  // FocusNode : StatefulWidget 위젯에서 키보드의 focus 상태를 얻고 키보드 이벤트를 처리하는 데 사용할 수 있음
  FocusNode _focusNode = FocusNode();
  // FocusNode의 상태를 저장하는 변수 선언
  bool isFocus = false;
  @override
  void initState() {
    super.initState();
    // 키보드를 해체하는 방법
    // 키보드가 활성화 된 상태에서 앱이 종료되거나 전화가 왔을 때 필드가 focus된 상태를 제거하고 사용하지 않는 FocusNode를 제공하여 키보드를 종료함
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    // 이벤트 리스너 추가
    _focusNode.addListener(() {
      _onFocusChange();
    });
  }

  // 이벤트가 동작할 때 실행하는 함수 만들기
  void _onFocusChange() {
    setState(() {
      isFocus = !isFocus;
    });
  }

  // 취소를 사용자가 눌렀을 때 focus된 상태를 제거하기 위한 함수
  void _unFocus() {
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            // 텍스트 필드 focusNode 속성에 직접 만든 FocusNode를 등록함
            focusNode: _focusNode,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[100],
              hintText: "검색어를 입력해 주세요",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Container(
          // 컨테이너의 크기를 focus된 상태에 따라 정의할 수 있음
          width: isFocus ? 50 : 0,
          // 자식 위젯을 focus된 상태에 따라 Text위젯과 SizedBox위젯을 만듬
          // Text위젯에 GestureDetector위젯을 감싸 onTap속성에 _unFocus함수를 연결함
          child: isFocus
              ? Center(
                  child: GestureDetector(
                    onTap: _unFocus,
                    child: Text(
                      "취소",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              : SizedBox(),
        )
      ],
    );
  }
}
