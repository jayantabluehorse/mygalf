// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final myProducts;
  final index;
  final updateLocation;
  final currenIndex;
  final productController;
  final cartController;

  const ProductCard(
      {super.key,
      required this.myProducts,
      required this.index,
      required this.updateLocation,
      required this.cartController,
      required this.currenIndex,
      required this.productController});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        //print(event);
        updateLocation(index);
      },
      onExit: (event) {
        updateLocation(-1);
      },
      child: Container(
        // padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: currenIndex == index
              ? [
                  const BoxShadow(
                    blurRadius: 15,
                    spreadRadius: 0.1,
                    color: Color.fromARGB(255, 179, 179, 179),
                  )
                ]
              : [
                  const BoxShadow(
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: Colors.white,
                  )
                ],
        ),
        //width: 287,
        //  height: 467,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                // productDetailsController
                //     .fetchProducts(productController.productList[index].id);
                Get.toNamed("/products/${myProducts[index].id}");
              },
              child: Container(
                height: 260,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      productController.productList[index].thumbnailImage,
                      // "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Get.toNamed("/products/${myProducts[index].id}");
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 1),
                    child: Text(
                      myProducts[index].title.toString(),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1C4A64)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 250,
                    child: Text(
                      myProducts[index].shortDescription == null
                          ? ""
                          : myProducts[index].shortDescription.toString(),
                      maxLines: 2,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF1C4A64)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const FittedBox(
                        child: Text(
                          "4.0",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      RatingBarIndicator(
                        rating: 4.0,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        itemCount: 5,
                        itemSize: 14,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                            myProducts[index].specialPrice == null
                                ? myProducts[index].specialPrice.toString()
                                : myProducts[index].price.toString(),
                            // : myProducts[index].specialPrice.toString(),
                            style: const TextStyle(
                                color: Color(0xFF1C4A64),
                                fontWeight: FontWeight.w700,
                                fontSize: 25)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      FittedBox(
                        child: Text(
                          myProducts[index].price.toString(),
                          style: const TextStyle(
                              color: Color(0xFF1C4A64),
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 10),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          " ${myProducts[index].discountPercent.toString()}% off",
                          // "(50% Off)",
                          style: const TextStyle(
                              color: Color(0xFF28C969),
                              fontWeight: FontWeight.w400,
                              fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Expanded(child: SizedBox()),
                  currenIndex == index
                      ? Container(
                          padding: const EdgeInsets.only(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        shape: ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.0)),
                                        backgroundColor:
                                            const Color(0xFFFF9900),
                                        //  shape: const RoundedRectangleBorder(),
                                        minimumSize: const Size(180, 50)

                                        //onPrimary: Colors.black,
                                        ),
                                    onPressed: () {
                                      // Storage.setItem(index);
                                      productController.handleAddtoCart(
                                          context: context,
                                          index: index,
                                          cartController: cartController);
                                    },
                                    icon: const Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                      size: 13.0,
                                    ),
                                    label: const Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(
                                  child: Icon(Icons.favorite_border,
                                      size: 24, color: Colors.black))
                            ],
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

// Widget productCard(
//       {required myProducts,
//       required index,
//       required updateLocation,
//       required currenIndex}) {
//     return MouseRegion(
//       onEnter: (event) {
//         //print(event);
//         updateLocation(index);
//       },
//       onExit: (event) {
//         updateLocation(-1);
//       },
//       child: Container(
//         // padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: currenIndex == index
//               ? [
//                   const BoxShadow(
//                     blurRadius: 15,
//                     spreadRadius: 0.1,
//                     color: Color.fromARGB(255, 179, 179, 179),
//                   )
//                 ]
//               : [
//                   const BoxShadow(
//                     blurRadius: 0,
//                     spreadRadius: 0,
//                     color: Colors.white,
//                   )
//                 ],
//         ),
//         //width: 287,
//         //  height: 467,

//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             InkWell(
//               onTap: () {
//                 // productDetailsController
//                 //     .fetchProducts(productController.productList[index].id);
//                 Get.toNamed(
//                     "/products/${productController.productList[index].id}");
//               },
//               child: Container(
//                 height: 260,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: NetworkImage(
//                           productController.productList[index].thumbnailImage,
//                           // "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
//                         ))),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Expanded(
//                 child: Container(
//               // padding: const EdgeInsets.only(left: 5, right: 5),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 8, right: 8, top: 2, bottom: 1),
//                     child: Text(
//                       productController.productList[index].title.toString(),
//                       softWrap: false,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                           fontSize: 19,
//                           fontWeight: FontWeight.w700,
//                           color: Color(0xFF1C4A64)),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   SizedBox(
//                     width: 250,
//                     child: Text(
//                       productController.productList[index].shortDescription ==
//                               null
//                           ? ""
//                           : productController
//                               .productList[index].shortDescription
//                               .toString(),
//                       maxLines: 2,
//                       softWrap: true,
//                       style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w300,
//                           color: Color(0xFF1C4A64)),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const FittedBox(
//                         child: Text(
//                           "2.75",
//                           style: TextStyle(
//                               color: Colors.orange,
//                               fontWeight: FontWeight.w700,
//                               fontSize: 14),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       RatingBarIndicator(
//                         rating: 2.75,
//                         itemBuilder: (context, index) => const Icon(
//                           Icons.star,
//                           color: Colors.orange,
//                         ),
//                         itemCount: 5,
//                         itemSize: 14,
//                         direction: Axis.horizontal,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 5),
//                   Container(
//                       child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       FittedBox(
//                         child: Text(
//                             productController.productList[index].price
//                                 .toString(),
//                             style: const TextStyle(
//                                 color: Color(0xFF1C4A64),
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 25)),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       const FittedBox(
//                         child: Text(
//                           "₹2,499",
//                           style: TextStyle(
//                               color: Color(0xFF1C4A64),
//                               fontWeight: FontWeight.w700,
//                               decoration: TextDecoration.lineThrough,
//                               fontSize: 10),
//                         ),
//                       ),
//                       const FittedBox(
//                         child: Text(
//                           "(50% Off)",
//                           style: TextStyle(
//                               color: Color(0xFF28C969),
//                               fontWeight: FontWeight.w400,
//                               fontSize: 10),
//                         ),
//                       ),
//                     ],
//                   )),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   const Expanded(child: SizedBox()),
//                   currenIndex == index
//                       ? Container(
//                           padding: const EdgeInsets.only(),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                   flex: 3,
//                                   child: SizedBox(
//                                     child: ElevatedButton.icon(
//                                         style: ElevatedButton.styleFrom(
//                                             shape: ContinuousRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(0.0)),
//                                             backgroundColor:
//                                                 const Color(0xFFFF9900),
//                                             //  shape: const RoundedRectangleBorder(),
//                                             minimumSize: const Size(180, 50)

//                                             //onPrimary: Colors.black,
//                                             ),
//                                         onPressed: () {
//                                           productController.handleAddtoCart(
//                                               context: context,
//                                               index: index,
//                                               cartController: _cartController);
//                                         },
//                                         icon: const Icon(
//                                           Icons.lock,
//                                           color: Colors.white,
//                                           size: 13.0,
//                                         ),
//                                         label: const Text(
//                                           "Add to Cart",
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w500),
//                                         )),
//                                   )),
//                               const Expanded(
//                                 child: Icon(Icons.favorite_border,
//                                     size: 24, color: Colors.black),
//                               )
//                             ],
//                           ),
//                         )
//                       : const SizedBox()
//                 ],
//               ),
//             )),
//           ],
//         ),
//       ),
//     );
//   }

// }
