import 'package:achievement_view/achievement_view.dart';

import 'assets.dart';
import 'select_input.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Cart extends StatefulWidget {
  final List<Farm> cart;
  const Cart({Key? key, required this.cart}) : super(key: key);

  @override
  State<Cart> createState() => _CartState(this.cart);
}

class _CartState extends State<Cart> {
  _CartState(this.cart);

  List<Farm> cart;

  int counter = 0;
  bool fola = false;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(cart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F5F7FB"),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leadingWidth: 60.w,
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Cart',
            style: TextStyle(color: HexColor("#424242"), fontSize: 14.sp),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 40.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: HexColor("#CFD8DC")),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: SvgPicture.asset(Assets.play),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Cart Items',
              style: TextStyle(color: HexColor("#424242"), fontSize: 14.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 560.h,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    var item = cart[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 342.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 18.h,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          item.image,
                                          height: 66.h,
                                          width: 56.w,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 18.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: HexColor("#000000"),
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 7.w,
                                        ),
                                        Text(
                                          item.amount,
                                          style: TextStyle(
                                              color: HexColor("#C39337"),
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7.w,
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 39.w,
                                          width: 39.w,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(16))),
                                          child: Center(
                                            child: InkWell(
                                                onTap: () {
                                                  _show(context);
                                                  setState(() {
                                                    cart.remove(item);
                                                  });
                                                },
                                                child: SvgPicture.asset(
                                                    Assets.delete)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                _decrementCounter();
                                              },
                                              child: Container(
                                                height: 30.w,
                                                width: 30.w,
                                                decoration: BoxDecoration(
                                                    color: HexColor("#28766F"),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Center(
                                                  child: Text(
                                                    '-',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 19.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color:
                                                          HexColor("#CFD8DC")),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Center(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15.0.w,
                                                      vertical: 5.w),
                                                  child: Text(
                                                    '$counter',
                                                    style: TextStyle(
                                                        color:
                                                            HexColor("#28766F"),
                                                        fontSize: 14.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            InkWell(
                                              onTap: () {
                                                _incrementCounter();
                                              },
                                              child: Container(
                                                height: 30.w,
                                                width: 30.w,
                                                decoration: BoxDecoration(
                                                    color: HexColor("#28766F"),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Center(
                                                  child: Text(
                                                    '+',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 19.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              'Sub-Total',
              style: TextStyle(color: HexColor("#424242"), fontSize: 14.sp),
            ),
            SizedBox(
              height: 13.h,
            ),
            Container(
              height: 75.h,
              width: 342.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: HexColor("#CFD8DC")),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(
                  'N7,576,500',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: HexColor("#000000"),
                      fontSize: 30.sp),
                ),
              ),
            ),
            SizedBox(
              height: 46.h,
            ),
          ]),
    );
  }

  void _show(context) {
    showCupertinoModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        context: context,
        builder: (context) {
          return Container(
              width: 375.w,
              height: 417.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r))),
              child: Scaffold(
                  body: ListView(
                children: [
                    SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 189.0),
                          child: Container(
                            height: 5,
                            width: 30,
                            decoration: BoxDecoration(
                              color: HexColor("#AFAFAF"),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                        ),
                         SizedBox(
                            height: 40.w,
                          ),
                  SvgPicture.asset(Assets.caution),
                     SizedBox(
                          height: 27,
                        ),
                  Center(
                    child: Text(
                      "Confirmation",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: HexColor("#000000"),
                          fontSize: 20.sp),
                    ),
                  ),
                    SizedBox(
                          height: 12,
                        ),
                  Center(
                    child: Text(
                      "Are you sure you want to delete this item from your cart?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: HexColor("#000000"),
                          fontSize: 14.sp),
                    ),
                  ),

                   SizedBox(
              height: 20.h,
            ),
            InkWell(
                      onTap: (){
             Navigator.pop(context);
            
                      },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:24.w),
                child: Container(
                    height: 57,
                    width: 57,
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        border: Border.all(color: HexColor("#CFD8DC")),
                        borderRadius: const BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black,fontSize: 24),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),

Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 5.w),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 327.w,
                              height: 48.h,
                              child: DecoratedBox(
                                decoration: BoxDecoration(),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.r),
                                      ),
                                      primary: HexColor("#28766F")),
                                  onPressed: () {
                                    HapticFeedback.heavyImpact();
                                    Navigator.pop(context);
                                    AchievementView(
                                      context,
                                      icon: Icon(Icons.check_circle),
                                      title: " ",
                                      subTitle: "Item Deleted",
                                      color: HexColor("#28766F"),
                                      isCircle: false,
                                      listener: (status) {
                                        print(status);
                                      },
                                    )..show();
                                  },
                                  child: Text(
                                    "Delete Item",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),


                ],
              )));
        });
  }
}
