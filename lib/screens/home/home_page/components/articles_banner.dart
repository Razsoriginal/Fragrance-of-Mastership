import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/articles/home/articles_home.dart';

import '../../../../components/section_title.dart';
import '../../../../constants/sizes.dart';
import 'articles_category_card.dart';

class ArticleCategory extends StatelessWidget {
  const ArticleCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'image': 'assets/images/Image Banner 2.png',
        'category': 'AHLE TASANNUN',
        'num': 18,
      },
      {
        'image': 'assets/images/Image Banner 3.png',
        'category': 'RAAFEZI',
        'num': 24,
      },
      // Add more categories as needed
    ];

    return Column(
      children: [
        SectionTitle(
          text: "Articles",
          press: () {
            Navigator.pushNamed(context, ArticlesHome.routeName);
          },
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              return ArticleCategoryCard(
                image: category['image'],
                category: category['category'],
                numOfBrands: category['num'],
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticlesHome(
                        tabName: category['category'],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
