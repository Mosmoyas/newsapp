// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/shared/presentation/color_manager.dart';
import 'package:newsapp/shared/presentation/values_manager.dart';

import '../presentation/styles_manager.dart';

Widget sbuildArticleItems() {
  return const Padding(
    padding: EdgeInsets.all(50),
    child: Text("News"),
  );
}

Widget buildArticleItems(article, dark) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Row(children: [
      Container(
          width: AppSize.s120,
          height: AppSize.s120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s10),
              image:
                  // DecorationImage( image: NetworkImage( '${article["urlToImage"]}'))
                  article['urlToImage'] != null
                      ? DecorationImage(
                          image: NetworkImage(article['urlToImage']),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: NetworkImage(
                              "https://k7f6k2y7.stackpathcdn.com/wp-content/uploads/2022/01/16431928991642760572DraftKings.jpg"),
                          fit: BoxFit.fill))),
      const SizedBox(
        width: AppSize.s20,
      ),
      Expanded(
        child: Container(
          height: AppSize.s120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(article['title'],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: getBoldStyle(
                        color:
                            dark ? ColorManager.darkGrey1 : ColorManager.white,
                        fontSize: AppSize.s18)),
              ),
              Text(article['publishedAt'],
                  style: getLightStyle(
                      color: ColorManager.lightGrey, fontSize: AppSize.s14))
            ],
          ),
        ),
      )
    ]),
  );
}

Widget conditionalBuilder(list,dark) => ConditionalBuilder(
      // condition: state is! NewsGetBusinessLoadingState,
      condition: list.isNotEmpty,

      builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildArticleItems(list[index],dark),
          separatorBuilder: (context, index) =>
              const Divider(height: 10, thickness: 2),
          itemCount: list.length),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
