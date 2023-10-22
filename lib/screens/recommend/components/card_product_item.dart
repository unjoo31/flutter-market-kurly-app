import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../components/product_item.dart';

class CardProductItem extends StatelessWidget {
  final Product item;

  const CardProductItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // elevation속성과 모서리 라운드 효과, margin 속성을 사용하기 위해 card위젯을 사용
    return Card(
      elevation: 1,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Expanded위젯은 ProductItem위젯을 부모 위젯이 Column인 것을 확인하고 형제 위젯 Container위젯의 height값을 제외하고
          // 남은 공간만큼 세로 방향으로 확장시킴 -> 이 위젯을 사용하게될 부모 위젯에 높이와 넓이의 값을 지정해 주어야 정상적으로 위젯을 만들어낼 수 있음
          Expanded(
            child: ProductItem(
              product: item,
              lineChange: true,
              textContainerHeight: 50,
            ),
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFFF5F5F5)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  "이렇게 치즈가 가득한 돈까스를 집에서 먹으니 좋네요."
                  "에어프라이어에 돌리니 간편하고 맛있어요",
                  textAlign: TextAlign.center,
                  // 글자의 최대 line 수를 2로 지정하고 이 위젯의 width 크기보다 글자가 넘칠 때 TextOverflow 속성을 사용함
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
