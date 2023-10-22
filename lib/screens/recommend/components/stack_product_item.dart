import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../components/circle_container.dart';
import '../../components/product_item.dart';

class StackProductItem extends StatelessWidget {
  // Container 위젯의 가로 크기를 지정하지 않고 사용하는 부모의 위젯에서 가로 크기를 정할 수 있도록 함
  final double width;
  final Product item;
  final int number;

  const StackProductItem({
    Key? key,
    required this.width,
    required this.item,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(left: 10),
      // ProductItem에 stack위젯을 활용함
      child: Stack(
        children: [
          ProductItem(product: item),
          Positioned(
            left: 10,
            bottom: 80,
            child: Text(
              "$number",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 85,
            child: CircleContainer(iconPath: "assets/icons/star.svg"),
          ),
          // 삼항 연산자를 사용해서 위젯을 구분함
          // number == 1일 때 투명도를 사용한 container 위젯으로 이미지 영역을 덮기 때문에 아래에 있는 inkwell 위젯의 onTap 동작을 막음
          number == 1
              ? Container(
                  height: 190,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                  child: Center(
                    child: Text(
                      "Coming Soon",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
