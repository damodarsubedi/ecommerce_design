import 'package:flutter/material.dart';
import 'package:tick_watch/util/app_color.dart';
import 'package:tick_watch/util/ui__helper.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late MediaQueryData queryData;
  List<CategoryItem> categories = [
    CategoryItem("assets/images/watch1.jpg", "Sporty"),
    CategoryItem("assets/images/watch2.jpg", "Iwatch"),
    CategoryItem("assets/images/watch3.jpg", "Classic"),
    CategoryItem("assets/images/watch4.jpg", "Kids"),
  ];
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return Column(children: [
      Row(
        children: [
          UIHelper.horizontal(context),
          const Text(
            "Categories",
            style: TextStyle(
              fontSize: UIHelper.textSizeMediumLarge,
              color: AppColors.darkBackgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      UIHelper.verticalSpaceMedium(context),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.19,
        child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  horizentalGrid(index, context),
                ],
              );
            }),
      ),
    ]);
  }

  Widget horizentalGrid(int index, BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: queryData.size.height * 0.1,
            width: queryData.size.width * 0.19,
            decoration: BoxDecoration(
              color: AppColors.darkBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.watch),
              // child: Image.asset(
              //   categories[index].icon,
              //   color: AppColors.primaryColor,
              // ),
            ),
          ),
          UIHelper.verticalSpaceSmall(context),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.24,
            child: Text(
              categories[index].name,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class CategoryItem {
  String icon, name;
  CategoryItem(this.icon, this.name);
}
