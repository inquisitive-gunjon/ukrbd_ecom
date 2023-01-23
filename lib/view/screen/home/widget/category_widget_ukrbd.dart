import 'package:ecom_ukrbd/data/model/response/Subcategories.dart';
import 'package:ecom_ukrbd/view/screen/category/subcategory_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/product/brand_and_category_product_screen_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/response/categories_ukrbd.dart';
class CategorySubcategoryWidgetUkrbd extends StatefulWidget {
  final Categories category;
  final Subcategories subCategory;
  final String categoryImage;
  final int colorCode;
  final bool isHome;
   CategorySubcategoryWidgetUkrbd({Key key, @required this.category,this.categoryImage,this.colorCode,this.subCategory,this.isHome}) : super(key: key);

  @override
  State<CategorySubcategoryWidgetUkrbd> createState() => _CategorySubcategoryWidgetUkrbdState();
}

class _CategorySubcategoryWidgetUkrbdState extends State<CategorySubcategoryWidgetUkrbd> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // if(widget.isHome){
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreenUkrbd(
        //     isBrand: false,
        //     id: widget.category.id.toString(),
        //     name: widget.category.category,
        //     isSubcategory: false,
        //     isHome: true,
        //   )));
        // }else{
          widget.subCategory!=null?
          Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreenUkrbd(
            isBrand: false,
            id: widget.subCategory.id.toString(),
            name: widget.subCategory.subCategory,
            isSubcategory: true,
            isHome: false,
          ))):
          Navigator.push(context, MaterialPageRoute(builder: (_) => SubCategoryScreenUkrbd(subcategories: widget.category.subcategories,)));
        // }
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(children: [
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.width/5,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: Offset(0,2),
                  )
                ],

                // border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.2)),
                // borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                borderRadius: BorderRadius.circular(10),
                // color: Theme.of(context).highlightColor,
                color: Color(widget.colorCode),
              ),
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),
                borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                child:
                // FadeInImage.assetNetwork(
                //   fit: BoxFit.cover,
                //   placeholder: Images.placeholder,
                //   image: category.image!=null?'${Provider.of<SplashProvider>(context,listen: false).baseUrls.categoryImageUrl}'
                //       '/${category.image}':null,
                //   imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.cover,),
                // ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: Images.placeholder,
                          image: "assets/category/3.png",
                          imageErrorBuilder: (c, o, s) => Image.asset("${widget.categoryImage}", fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.width*.4,
                          width: MediaQuery.of(context).size.width*.18,
                          // color: Colors.deepOrangeAccent,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.subCategory==null?widget.category.category:widget.subCategory.subCategory,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              overflow: TextOverflow.visible,
                              style: titilliumRegular.copyWith(fontSize: 12,
                                  color: ColorResources.getTextTitle(context)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // SizedBox(height: 4),
          // Container(
          //   child: Center(
          //     child: Text(widget.category.category,
          //       textAlign: TextAlign.center,
          //       maxLines: 1,
          //       overflow: TextOverflow.ellipsis,
          //       style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL,
          //           color: ColorResources.getTextTitle(context)),
          //     ),
          //   ),
          // ),

        ]),
      ),
    );
  }
}
