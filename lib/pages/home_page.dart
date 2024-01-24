import 'package:flutter/material.dart';
import 'package:tick_watch/component/categories.dart';
import 'package:tick_watch/component/popular_product.dart';
import 'package:tick_watch/util/app_color.dart';
import 'package:tick_watch/util/ui__helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tick Watch",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        leading: const SizedBox(),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            UIHelper.verticalSpaceMedium(context),
            UIHelper.verticalSpaceMedium(context),
            const CategoryPage(),
            const PopularProducts(),
          ],
        ),
      ),
    );
  }
}
