import 'package:flutter/material.dart';
import 'package:tick_watch/pages/products_page.dart';
import 'package:tick_watch/util/app_color.dart';
import 'package:tick_watch/util/ui__helper.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  late MediaQueryData queryData;
  late Orientation orientation;
  List<Popularprod> popularprods = [
    Popularprod('Seko5', "40", "assets/images/watch9.jpg"),
    Popularprod('Naviforce', "40", "assets/images/watch10.jpg"),
    Popularprod('Rolex', "40", "assets/images/watch8.jpg"),
    Popularprod('Marki', "40", "assets/images/watch9.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    orientation = queryData.orientation;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              UIHelper.horizontalSpaceMedium(context),
              const Text(
                "Popular Product",
                style: TextStyle(
                  fontSize: UIHelper.textSizeMediumLarge,
                  color: AppColors.darkBackgroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "product",
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductsPage()),
                      );
                    },
                    child: buildItem(popularprods[0])),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductsPage()),
                    );
                  },
                  child: buildItem(popularprods[1])),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductsPage()),
                  );
                },
                child: buildItem(popularprods[2]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductsPage()),
                  );
                },
                child: buildItem(popularprods[3]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildItem(Popularprod product) {
    return Card(
      color: Colors.white,
      elevation: 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0, left: 0),
            height: queryData.size.height * 0.18,
            width: queryData.size.width * 0.44,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Image.asset(
              product.image,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          UIHelper.verticalSpaceSmall(context),
          Text(
            product.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              UIHelper.horizontalSpaceSmall(context),
              Text(
                "Price: \$${product.price}",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Popularprod {
  String name, price, image;

  Popularprod(this.name, this.price, this.image);
}
