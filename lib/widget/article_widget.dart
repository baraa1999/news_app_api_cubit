import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:news_app_api_cubit/services/utils.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreennSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 60,
                  width: 60,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                          width: size.height * 0.12,
                          height: size.height * 0.12,
                          boxFit: BoxFit.fill,
                          imageUrl:
                              "https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
