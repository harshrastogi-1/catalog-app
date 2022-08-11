import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/data/datasources/local/const.dart';
import '../../../../data/datasources/local/dao/cart_dao.dart';
import '../../../../data/datasources/local/entities/Cart.dart';
import '../../../../domain/entities/Item.dart';
import '../../../controller/cart_controller.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  final CartDao dao;
  const AddToCart({Key? key, required this.catalog, required this.dao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    // final cart = Get.put(CartController());
    //  isInCart = false.obs;
    // var isInCart = cart.cartItem.contains(catalog).obs;
    // print(cart.cartItem.contains(catalog));
    return Padding(
      padding: const EdgeInsets.only(right:16.0),
      child: GestureDetector(
        onTap: () async {
          var cartProduct = await dao.getItemInCartByUid(UID, catalog.id);

          if (cartProduct!= null) {
            cartProduct.quantity += 1;
            await cartController.updateToCart(cartProduct);
          } else if(cartProduct==null){
            Cart cart = Cart(
                id: catalog.id,
                price: catalog.price,
                category: catalog.desc,
                imageUrl: catalog.image,
                quantity: 1,
                name: catalog.name,
                uid: UID);
            await cartController.addToCart(cart);
          }
        },
        child: const Icon(Icons.shopping_cart,color: Color.fromARGB(255, 10, 40, 65),),
      ),
    );
    // return Obx(
    //   () => cartController.isSelected(catalog)
    //       ? IconButton(
    //           onPressed: () async{
    //             var cartProduct= await dao.getItemInCartByUid(catalog.id);
    //             cartController.removeFromCart(cartProduct!);
    //           },
    //           icon: const Icon(Icons.delete))
    //       : IconButton(
    //           onPressed: () async{
    //             // isInCart.value = !isInCart.value;
    //             var cartProduct= await dao.getItemInCartByUid(catalog.id);
    //             if (cartProduct != null) {
    //                 cartProduct.quantity += 1;
    //                 await cartController.updateToCart(cartProduct);
    //               } else {
    //                 Cart cart = Cart(
    //                     id: catalog.id,
    //                     price: catalog.price,
    //                     category: catalog.desc,
    //                     imageUrl: catalog.image,
    //                     quantity: 1,
    //                     name: catalog.name,
    //                     );
    //                 await cartController.addToCart(cart);
    //               }
    //           },
    //           icon: const Icon(Icons.add)),
    // );
  }
}
