import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tick_watch/pages/cart_page.dart';
import 'package:tick_watch/util/app_color.dart';
import 'package:tick_watch/util/ui__helper.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late MediaQueryData queryData;
  int currentindex = 0;
  List<String> images = [
    "assets/images/watch1.jpg",
    "assets/images/watch2.jpg",
    "assets/images/watch3.jpg",
    "assets/images/watch4.jpg",
    "assets/images/watch5.jpg",
  ];

  List<Color> colors = [Colors.red, Colors.yellow, Colors.black, Colors.grey];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int selectedindex = 0;
  _onselected(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  String price = "400";
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: queryData.size.height,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: queryData.size.height * 0.05,
                ),
                SizedBox(
                  height: queryData.size.height * 0.01,
                ),
                Hero(
                  tag: "product",
                  child: Container(
                    color: Colors.white,
                    height: queryData.size.height * 0.25,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentindex = index;
                          });
                        },
                      ),
                      items: images.map((i) {
                        return Builder(builder: (BuildContext context) {
                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            margin: const EdgeInsets.only(right: 0),
                            child: Image.asset(
                              i,
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            ),
                          );
                        });
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: queryData.size.height * 0.03,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(images, (index, url) {
                      return Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentindex == index ? AppColors.browndark : const Color(0xFFA9A9A9)));
                    })),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Seko5',
                        style: TextStyle(
                          fontSize: UIHelper.textSizeMediumLarge,
                          color: AppColors.browndark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '\$$price',
                        style: const TextStyle(
                          fontSize: UIHelper.textSizeMediumLarge,
                          color: Color(0xFFb36200),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: queryData.size.height * 0.07,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(children: [buildContainer(index)]);
                      }),
                ),
                SizedBox(
                  height: queryData.size.height * 0.02,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Specification',
                    style: TextStyle(
                      fontSize: UIHelper.textSizeMediumLarge,
                      color: AppColors.browndark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: queryData.size.height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      height: queryData.size.height * 0.01,
                      width: queryData.size.width * 0.03,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      width: queryData.size.width * 0.02,
                    ),
                    const Text('Dimension'),
                  ],
                ),
                SizedBox(
                  height: queryData.size.height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      height: queryData.size.height * 0.01,
                      width: queryData.size.width * 0.03,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      width: queryData.size.width * 0.02,
                    ),
                    const Text('Modern'),
                  ],
                ),
                SizedBox(
                  height: queryData.size.height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      height: queryData.size.height * 0.01,
                      width: queryData.size.width * 0.03,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      width: queryData.size.width * 0.02,
                    ),
                    const Text('Fabric and metal'),
                  ],
                ),
                SizedBox(
                  height: queryData.size.height * 0.02,
                ),
                SizedBox(
                  height: queryData.size.height * 0.06,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: queryData.size.width * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        final snackBar = SnackBar(
                          content: const Text(
                            'Product Added To cart',
                            style: TextStyle(color: Colors.white),
                          ),
                          duration: const Duration(seconds: 2),
                          backgroundColor: AppColors.primaryColor,
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Product Removed from cart"),
                                backgroundColor: Color.fromARGB(255, 245, 131, 1),
                              ));
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Container(
                        height: queryData.size.height * 0.07,
                        width: queryData.size.width * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        width: MediaQuery.of(context).size.width * 0.82,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CartPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            backgroundColor: AppColors.primaryColor,
                          ),
                          child: const Center(
                            child: Text(
                              "Buy",
                              style: TextStyle(
                                fontSize: UIHelper.textSizeMediumLarge,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainer(int index) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            _onselected(index);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            height: queryData.size.height * 0.04,
            width: queryData.size.width * 0.05,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: selectedindex == index
                  ? Border.all(color: Colors.grey, width: 2)
                  : Border.all(color: Colors.transparent),
              color: colors[index],
            ),
          ),
        )
      ],
    );
  }
}
