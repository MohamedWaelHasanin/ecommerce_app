import 'package:ecommerce_app/models/Product.dart';
import 'package:flutter/material.dart';

class ListItemHome extends StatelessWidget {
  final Product product;
  const ListItemHome({super.key,required this.product});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: Image.network(
                  product.imgUrl,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 40,
                    height: 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(16.0),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          '${product.discount}%',
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8.0,),
          Text(
            product.category,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Colors.grey,
            ),
          ),
          Text(
            product.title,
            style:Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight(600)),
          ),
          Text(
            '${product.price}\$',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Colors.red,
              fontWeight: FontWeight(600)
            ),
          )

        ],
      ),
    );
  }
}
