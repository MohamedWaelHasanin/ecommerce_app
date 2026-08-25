import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/utilities/assets.dart';
import 'package:ecommerce_app/views/widgets/list_item_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// TODO: Temp code till refactor to a seperate class with a seperate context
  Widget _builderHeaderOfList(BuildContext context, {
    required String title,
    VoidCallback? onTap,
    required String description,
  }) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme
                .of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                'View all',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
              ),
            ),
          ],
        ),
        Text(
          description,
          style: Theme
              .of(context)
              .textTheme
              .titleSmall
          !
              .copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size
        .height;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ///
        Stack(
          alignment: AlignmentGeometry.bottomLeft,
          children: [
            Image.network(
              AppAssets.topBannerHomePageAsset,
              width: double.infinity,
              height: size * 0.25,
              fit: BoxFit.cover,
            ),
            Opacity(
              opacity: 0.1,
              child: Container(
                width: double.infinity,
                height: size * 0.25,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Text(
                'Street clothes',
                style: Theme
                    .of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              _builderHeaderOfList(
                context,
                title: 'Sale',
                description: 'Super summer sale',
              ),
              const SizedBox(height: 8.0,),
              SizedBox(
                height: 310,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: dummyProducts.map(
                          (e) => Padding(
                            padding: const EdgeInsets.fromLTRB(8.0,8,0,0),
                        child: ListItemHome(product:e),
                      )
                  ).toList(),
                ),
              ),
            ],
          ),

        ),
        ///
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              _builderHeaderOfList(
                context,
                title: 'New',
                description: 'Super new products',
              ),
              const SizedBox(height: 8.0,),
              SizedBox(
                height: 350,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: dummyProducts.map(
                          (e) => Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,8,0,0),
                        child: ListItemHome(product:e),
                      )
                  ).toList(),
                ),
              ),
            ],
          ),

        ),
      ],
    );
  }
}
