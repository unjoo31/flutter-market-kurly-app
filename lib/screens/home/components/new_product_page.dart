import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_market_kurly_app/screens/home/components/product_filter_button.dart';

import '../../../models/product.dart';
import '../../components/circle_container.dart';
import '../../components/product_item.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: () {
              return Future<void>.delayed(const Duration(seconds: 1));
            },
          ),
          SliverAppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            titleSpacing: 0,
            actions: [
              SizedBox(
                child: ProductFilterButton(),
                width: 100,
              ),
            ],
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              // 4
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 30.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.6,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // 5
                return Stack(
                  children: [
                    ProductItem(
                      product: productList[index],
                    ),
                    Positioned(
                      bottom: 90,
                      right: 10,
                      child: CircleContainer(
                          iconPath: 'assets/icons/shopping-cart.svg'),
                    )
                  ],
                );
              },
              // 6
              childCount: productList.length,
            ),
          ),
        ],
      ),
    );
  }
}
