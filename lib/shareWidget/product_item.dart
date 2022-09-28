import 'package:flutter/material.dart';

import '../rep/json_model/add_product_model.dart';
import '../rep/json_model/all-products.dart';

class ProdectItem extends StatelessWidget {
  var product;

  ProdectItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(children: [
        Text(product.productName ?? ""),
        Expanded(
          child: ListView.builder(
              //    scrollDirection: Axis.horizontal,
              itemCount: product.productOptions?.productColors?.length,
              itemBuilder: (context, pos) {
                return SizedBox(
                  height: 250,
                  child: ListView.builder(   scrollDirection: Axis.horizontal,
                      itemCount: product.productOptions?.productColors?[pos]
                          .colorImages?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(children: [
                            Image.network(product.productOptions!
                                .productColors![pos].colorImages![index],width: 100)
                         
                         ,
                         Text(product.productOptions!
                             .productColors![pos].colorName!)
                          ]),
                        );
                      }),
                );
              }),
        ),
      ]),
    );
  }
}
