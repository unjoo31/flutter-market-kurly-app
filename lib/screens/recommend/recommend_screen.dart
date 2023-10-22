import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../theme.dart';
import 'components/card_product_item.dart';
import 'components/stack_product_item.dart';

class RecommendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("추천"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "베이커리 인기 급상승 랭킹",
              style: textTheme().headlineMedium,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => StackProductItem(
                width: 160,
                item: productList[index],
                number: index + 1,
              ),
              itemCount: productList.length,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text("후기가 좋은 상품", style: textTheme().headlineMedium),
          ),
          const SizedBox(height: 15),
          Container(
            height: 360,
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 40),
              scrollDirection: Axis.horizontal,
              // CardProductItem위젝은 expanded위젯을 감싼 card위젯이기 때문에 width, height 값을 지정해줘야함
              itemBuilder: (context, index) => SizedBox(
                width: 320,
                child: CardProductItem(
                  item: productList[index],
                ),
              ),
              itemCount: productList.length,
            ),
          )
        ],
      ),
    );
  }
}
