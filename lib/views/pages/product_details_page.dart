import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utilities/assets.dart';

import '../../models/Product.dart';
class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({super.key,required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_new),onPressed: ()=>Navigator.pop(context),),
        title: Center(
            child: Text(widget.product.title,style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),)
        ),
        actions: [
          Center(
            child: SizedBox(
              width: 50,
                child: IconButton(icon:Icon(Icons.share),onPressed: (){},)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: NetworkImage(widget.product.imgUrl),
                width: double.infinity,
                height: size.height*0.6,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.title,
                          style:Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight(600)),
                        ),
                        const SizedBox(height: 2.0,),
                        Text(
                          widget.product.category,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            for(int i=0;i<5;i++)
                              Icon(
                                Icons.star_rate,
                                size: 16,
                                color:Colors.yellow,
                              ),
                            Text(' (10)',style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.grey,
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text("\$${widget.product.price}",style:Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight(600)) ,)
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("There is a dummy description about the product with all details and information i will add it in the future"),
              ),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: MainButton(text: "Add To Cart", onTap: (){}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
