import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';
import 'package:ecom_ukrbd/provider/cart_provider_ukrbd.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/screen/checkout/checkout_screen_ukrbd.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CartScreenUkrbd extends StatefulWidget {
  static const String routeName = "/cartScreenUkrbd";

  const CartScreenUkrbd({Key key}) : super(key: key);

  @override
  _CartScreenUkrbdState createState() => _CartScreenUkrbdState();
}

class _CartScreenUkrbdState extends State<CartScreenUkrbd> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    _loadCart(context);
    super.initState();
  }

  _loadCart(BuildContext context) async {
    Provider.of<CartProviderUkrbd>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.3,
        // backgroundColor: Colors.white,
        //  centerTitle: true,
        title: Text("Cart"),
        actions: [
          //Icon(Icons.arrow_back,size: size.width*(Dimensions.ICON_SIZE_DEFAULT/360)),
          //SizedBox(width: size.width*(12/360),),
          //Text("Cart",style: TextStyle(fontSize:size.width*(Dimensions.FONT_SIZE_EXTRA_LARGE/360) ),),
          Consumer<CartProviderUkrbd>(
            builder: (context, cartProviderUkrbd, child) {
              return GestureDetector(
                onTap: () {
                  cartProviderUkrbd.deleteCart();
                },
                child: Container(
                  height: 20,
                  // width: 90,
                  child: Row(
                    children: [
                      Text(
                        "Clear Cart",
                        style: TextStyle(
                            fontSize: size.width *
                                (Dimensions.FONT_SIZE_SMALL / 360)),
                      ),
                      InkWell(
                          onTap: () {
                            cartProviderUkrbd.deleteCart();
                          },
                          child: Icon(
                            Icons.delete,
                            size: size.width *
                                (Dimensions.ICON_SIZE_DEFAULT / 360),
                          )),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Stack(
        // mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: size.width*(15/360)),
              //   height: size.width*(60/360),
              //   width: size.width,
              //   decoration: BoxDecoration(
              //       border: Border(bottom: BorderSide(color: Colors.grey.shade300,width: 1))
              //   ),
              //   child:Row(
              //     mainAxisSize: MainAxisSize.max,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //
              //       Icon(Icons.check_box,size: size.width*(Dimensions.ICON_SIZE_DEFAULT/360),color: Theme.of(context).primaryColor,),
              //       SizedBox(width: size.width*(25/360),),
              //       Text("Mobile",style: TextStyle(fontSize:size.width*(Dimensions.FONT_SIZE_LARGE/360))),
              //
              //     ],
              //   ),
              // ),
              SizedBox(
                height: size.width * (300 / 360),
                width: size.width,
                child: Consumer<CartProviderUkrbd>(
                    builder: (context, cartProviderUkrbd, child) {
                  return ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartProviderUkrbd.cartList.length,
                      itemBuilder: (context, index) {
                        Products product = cartProviderUkrbd.cartList[index];
                        int itemCount = cartProviderUkrbd.itemCount[index];
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * (15 / 360),
                              vertical: size.width * (8 / 360)),
                          margin: EdgeInsets.symmetric(
                              vertical: size.width * (8 / 360)),
                          //height: size.width*(60/360),
                          width: size.width,
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (){
                                  cartProviderUkrbd
                                      .deleteOneCartItem(index, product);
                                },
                                child: Icon(
                                  Icons.check_box,
                                  size: size.width *
                                      (Dimensions.ICON_SIZE_DEFAULT / 360),
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: size.width * (25 / 360),
                              ),
                              // Text("Mobile",style: TextStyle(fontSize:size.width*(Dimensions.FONT_SIZE_LARGE/360))),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: FadeInImage.assetNetwork(
                                  placeholder: Images.placeholder,
                                  width: size.width * (40 / 360),
                                  height: size.width * (50 / 360),
                                  fit: BoxFit.cover,
                                  image: 'https://ukrbd.com/images/products/' +
                                      product.productimages[0].image,
                                  imageErrorBuilder: (c, o, s) => Image.asset(
                                      Images.placeholder,
                                      width: size.width * (40 / 360),
                                      height: size.width * (50 / 360),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                width: size.width * (18 / 360),
                              ),
                              Expanded(
                                  child: SizedBox(
                                child: RichText(
                                  text: TextSpan(
                                    text: '',
                                    //style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '${product.productName}',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: size.width *
                                                (Dimensions.FONT_SIZE_DEFAULT /
                                                    360)),
                                      ),
                                      TextSpan(
                                          text:
                                              '\nprice :${product.price}',
                                          style: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontSize: size.width *
                                                  (Dimensions.FONT_SIZE_SMALL /
                                                      360))),
                                    ],
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: size.width * (35 / 360),
                                    width: size.width * (90 / 360),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          // left: size.w
                                          // idth * (-17.5 / 360),
                                          // top: 0,
                                          // bottom: 0,
                                          // width: MediaQuery.of(context).size.width,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: GestureDetector(
                                              onTap: () {
                                                if (itemCount >= 2) {
                                                  cartProviderUkrbd.minus(index, product);
                                                }
                                                if (itemCount == 1) {
                                                  cartProviderUkrbd.deleteCartItem(product);
                                                }
                                              },
                                              child: Container(
                                                height: size.width * (35 / 360),
                                                width: size.width * (35 / 360),
                                                // color: Colors.white,
                                                //alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(color: Colors.deepPurpleAccent,
                                                        spreadRadius: 2,
                                                        offset: Offset(0, 0),
                                                      ),
                                                    ]),
                                                child: Center(
                                                    child: Icon(
                                                  FontAwesomeIcons.minus,
                                                  size: size.width * (Dimensions.FONT_SIZE_DEFAULT / 360),
                                                 ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          // right: size.width * (-17.5 / 360),
                                          // top: 0,
                                          // bottom: 0,
                                          // width: MediaQuery.of(context).size.width,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: GestureDetector(
                                              onTap: () {
                                                cartProviderUkrbd.plus(index, product);
                                              },
                                              child: Container(
                                                height: size.width * (35 / 360),
                                                width: size.width * (35 / 360),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.deepPurpleAccent,
                                                        spreadRadius: 2,
                                                        offset: Offset(0, 0),
                                                      ),
                                                    ]),
                                                child: Center(
                                                  child: Icon(
                                                    FontAwesomeIcons.plus,
                                                    size: size.width * (Dimensions.FONT_SIZE_DEFAULT / 360),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Text("${cartProviderUkrbd.itemCount[index]}"),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ))
                            ],
                          ),
                        );
                      });
                }),
              ),

              SizedBox(
                height: size.width * (16 / 360),
              ),

              Consumer<CartProviderUkrbd>(
                builder: (context, cartProviderUkrbd, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * (40 / 360),
                        vertical: size.width * (8 / 360)),
                    width: size.width,
                    height: size.width * (150 / 360),
                    // color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sub Total",
                              style: TextStyle(
                                  fontSize: size.width *
                                      (Dimensions.FONT_SIZE_SMALL / 360),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              child: RichText(
                                text: TextSpan(
                                  text: '',
                                  //style: DefaultTextStyle.of(context).style,
                                  children: [
                                    TextSpan(
                                      text: '৳ ',
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: size.width *
                                              (Dimensions.FONT_SIZE_SMALL /
                                                  360)),
                                    ),
                                    TextSpan(
                                        text: '${cartProviderUkrbd.subTotal}',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: size.width *
                                                (Dimensions.FONT_SIZE_SMALL /
                                                    360))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "profit",
                              style: TextStyle(
                                  fontSize: size.width *
                                      (Dimensions.FONT_SIZE_SMALL / 360),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              child: RichText(
                                text: TextSpan(
                                  text: '',
                                  //style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' ৳ ',
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: size.width *
                                              (Dimensions.FONT_SIZE_SMALL /
                                                  360)),
                                    ),
                                    TextSpan(
                                        text: '0',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: size.width *
                                                (Dimensions.FONT_SIZE_SMALL /
                                                    360))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: size.width *
                                      (Dimensions.FONT_SIZE_SMALL / 360),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              child: RichText(
                                text: TextSpan(
                                  text: '',
                                  //style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '৳ ',
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: size.width *
                                              (Dimensions.FONT_SIZE_SMALL /
                                                  360)),
                                    ),
                                    TextSpan(
                                        text: '${cartProviderUkrbd.subTotal}',
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: size.width *
                                                (Dimensions.FONT_SIZE_SMALL /
                                                    360))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Consumer<CartProviderUkrbd>(
          builder: (context, cartProviderUkrbd, child) {
            return cartProviderUkrbd.cartList.length > 0
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width * (16 / 360), vertical: size.width * (5 / 360)),
                    color: Theme.of(context).primaryColor.withOpacity(.08),
                    height: size.width * (90 / 360),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: SizedBox(
                            child: RichText(
                              text: TextSpan(
                                text: '',
                                //style: DefaultTextStyle.of(context).style,
                                children: [
                                  TextSpan(
                                    text: 'Continue Shopping ',
                                    style: TextStyle(color: Colors.black54, fontSize: size.width * (Dimensions.FONT_SIZE_SMALL / 360)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => CheckoutUkrbd(cartSubTotal: cartProviderUkrbd.subTotal.toString(),)));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: size.width * (15 / 360)),
                            height: size.width * (45 / 360),
                            width: size.width,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1))),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  Images.cart_image,
                                  height: size.width * (18 / 360),
                                  width: size.width * (18 / 360),
                                  fit: BoxFit.cover,
                                  color: Colors.black54,
                                ),
                                //Icon(Icons.cart,size: size.width*(Dimensions.ICON_SIZE_DEFAULT/360),color: Colors.white,),
                                SizedBox(
                                  width: size.width * (25 / 360),
                                ),
                                // Text("Mobile",style: TextStyle(fontSize:size.width*(Dimensions.FONT_SIZE_LARGE/360),color: Colors.white)),

                                SizedBox(
                                  child: RichText(
                                    text: TextSpan(
                                      text: '',
                                      //style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              ' ৳ ${cartProviderUkrbd.subTotal}',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: size.width *
                                                  (Dimensions.FONT_SIZE_LARGE /
                                                      360)),
                                        ),
                                        TextSpan(
                                          text: '  items ${cartProviderUkrbd.totalItem}',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: size.width *
                                                  (Dimensions.FONT_SIZE_SMALL /
                                                      360)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("Checkout",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: size.width * (Dimensions.FONT_SIZE_LARGE / 360)
                                            )
                                        )
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox();
          },
        ),
      ),
    );
  }
}
