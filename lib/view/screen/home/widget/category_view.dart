// import 'package:flutter/material.dart';
// import 'package:flutter_sixvalley_ecommerce/provider/category_provider.dart';
// import 'package:flutter_sixvalley_ecommerce/view/screen/category/all_category_screen.dart';
// import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/category_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/view/screen/product/brand_and_category_product_screen.dart';
// import 'package:provider/provider.dart';
//
// import 'category_shimmer.dart';
//
// class CategoryView extends StatelessWidget {
//   final bool isHomePage;
//   CategoryView({@required this.isHomePage});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CategoryProvider>(
//       builder: (context, categoryProvider, child) {
//
//         return categoryProvider.categoryList.length != 0 ?
//         GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4,
//             crossAxisSpacing: 5,
//             mainAxisSpacing: 5,
//             childAspectRatio: (1/1.4),
//           ),
//           itemCount: isHomePage
//               ? categoryProvider.categoryList.length > 8
//                  ? 8
//                  : categoryProvider.categoryList.length
//               : categoryProvider.categoryList.length,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (BuildContext context, int index) {
//
//             return InkWell(
//               onTap: () {
//
//                 Provider.of<CategoryProvider>(context, listen: false).changeSelectedIndex(index);
//                 Navigator.push(context, MaterialPageRoute(builder: (_) => AllCategoryScreen()));
//                 // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
//                 //   isBrand: false,
//                 //   id: categoryProvider.categoryList[index].id.toString(),
//                 //   name: categoryProvider.categoryList[index].name,
//                 // )));
//               },
//               child: CategoryWidget(category: categoryProvider.categoryList[index]),
//             );
//
//           },
//         )
//
//         : CategoryShimmer();
//
//       },
//     );
//   }
// }
//
//
//