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

              ),
              Stack(
                children: [
                  SizedBox(
                    width: 170,
                    height: 213,
                  ),
                   Positioned(
                     right: 10,
                     bottom: 0,
                     child: ElevatedButton(
                      onPressed: (){},
                      style:ElevatedButton.styleFrom(
                          shape:const CircleBorder(),
                          minimumSize: const Size(50, 50),
                          padding: EdgeInsets.zero,
                          elevation: 2
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        size: 25,
                        color: Colors.black54,
                      ),
                                       ),
                   ),
                ],
              ),
            ],
          ),
          // const SizedBox(height: 6.0,),
          Row(
            children: [
              for(int i=0;i<5;i++)
                Icon(
                  Icons.star_rate,
                  size: 16,
                  color: Colors.yellow,
                ),
              Text(' (10)',style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Colors.grey,
              ),
              ),
            ],
          ),
          const SizedBox(height: 2.0,),
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
          Row(
            children: [
              Stack(
                alignment: Alignment.center, // Centers the line vertically over the text
                children: [
                  Text(
                    '${product.price}\$',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.grey,
                    fontWeight:  FontWeight(600),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5,),
              Text(
                '${product.price-product.price*(product.discount/100)}\$',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight(600)
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
