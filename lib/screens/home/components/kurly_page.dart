import 'package:flutter/material.dart';
import 'package:flutter_market_kurly_app/screens/home/components/kurly_banner_item.dart';

import '../../../models/product.dart';
import '../../../theme.dart';
import '../../components/product_item.dart';

class KurlyPage extends StatelessWidget {
  const KurlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 335,
          child: KurlyBannerItem(),
        ),
        SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16),
          child: Text("이 상품 어때요?", style: textTheme().displayLarge),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 10),
              child: SizedBox(
                width: 150,
                child: ProductItem(
                  product: productList[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
