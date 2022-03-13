import 'dart:ui';

import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'assets.dart';
import 'cart.dart';

class SelectInput extends StatefulWidget {
  const SelectInput({Key? key}) : super(key: key);

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  List<Farm> _farms = [];
  List<Farm> _cartList = [];
  bool cart = false;
  @override
  void initState() {
    super.initState();
    _populateCart();
  }

  void _populateCart() {
    var list = <Farm>[
      Farm(
        name: "Rice seeds",
        image: Assets.farm,
        amount: "7,500 NGN",
      ),
      Farm(
        name: "NPK Fertilizer",
        image: Assets.farm2,
        amount: "7,500 NGN",
      ),
      Farm(
        name: "Plough",
        image: Assets.farm3,
        amount: "7,500 NGN",
      ),
      Farm(
        name: "Hoe",
        image: Assets.farm4,
        amount: "7,500 NGN",
      ),
      Farm(
        name: "Corn seeds",
        image: Assets.farm5,
        amount: "7,500 NGN",
      ),
      Farm(
        name: "Digger",
        image: Assets.farm6,
        amount: "7,500 NGN",
      ),
      Farm(
        name: "Barley seeds",
        image: Assets.farm7,
        amount: "7,500 NGN",
      ),
      Farm(
        name: "Oat",
        image: Assets.farm8,
        amount: "7,500 NGN",
      ),
    ];

    setState(() {
      _farms = list;
    });
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
            'Order Input',
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: HexColor("#CFD8DC")),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: SvgPicture.asset(Assets.search),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                InkWell(
                  onTap: () {
                    if (_cartList.isNotEmpty)
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Cart(
                            cart: _cartList,
                          ),
                        ),
                      );
                  },
                  child: Container(
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: cart ? HexColor("#118B63") : Colors.white,
                        border: Border.all(color: HexColor("#CFD8DC")),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          SvgPicture.asset(
                            Assets.c,
                            color: cart ? Colors.white : Colors.black,
                          ),
                          if (_cartList.length > 0)
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: CircleAvatar(
                                radius: 8.0,
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                child: Text(
                                  _cartList.length.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 18.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Farming inputs',
                  style: TextStyle(color: HexColor("#424242"), fontSize: 14.sp),
                ),
                Container(
                  width: 84.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: HexColor("#CFD8DC")),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Filter',
                        style: TextStyle(
                            color: HexColor("#424242"), fontSize: 14.sp),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(Assets.filter),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: _farms.length,
                  itemBuilder: (context, index) {
                    var item = _farms[index];
                    return InkWell(
                      onTap: () {
                        _show(context);
                        setState(() {
                          if (_cartList.contains(item))
                            _cartList.remove(item);
                          else
                            _cartList.add(item);
                        });
                        cart = true;
                      },
                      child: Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        color: Colors.white,
                        child: Container(
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Image.asset(item.image),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                item.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#000000"),
                                    fontSize: 14.sp),
                              ),
                              Text(
                                item.amount,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#28766F"),
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    // your Card will go here
                  }),
            )
          ]),
    );
  }

  int counter = 0;
  void _show(context) {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                height: 386.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25.r))),
                child: Scaffold(
                    backgroundColor: HexColor("#F6F6F6"),
                    body: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 149.0),
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
                        Row(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 14.h,
                              ),
                              Image.asset(
                                Assets.farm7,
                                height: 100.w,
                                width: 100.w,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    Assets.cart1,
                                    height: 30.w,
                                    width: 30.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Image.asset(
                                    Assets.cart2,
                                    height: 30.w,
                                    width: 30.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Image.asset(
                                    Assets.cart3,
                                    height: 30.w,
                                    width: 30.w,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25.w,
                              ),
                              Text(
                                "Units needed",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#000000"),
                                    fontSize: 14.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Barley seeds (pack)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: HexColor("#000000"),
                                    fontSize: 16.sp),
                              ),
                              Text(
                                "2500 NGN ・In stock ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#28766F"),
                                    fontSize: 14.sp),
                              ),
                              Text(
                                "Lorem ipsum dolor sit \namet,consectetur \nadipiscing elit.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#000000"),
                                    height: 2,
                                    fontSize: 12.sp),
                              )
                            ],
                          ),
                        ]),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                            height: 69,
                            width: 57,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    fola ? '$counter' : 'Amount',
                                    style: TextStyle(
                                        color: HexColor("#28766F"),
                                        fontSize: 14.sp),
                                  ),
                                  Container(
                                    height: 40.w,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        color: HexColor("#F6F6F6"),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                fola = true;
                                              });
                                              _incrementCounter();
                                            },
                                            child: Icon(
                                              Icons.keyboard_arrow_up_outlined,
                                            )),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              fola = true;
                                            });
                                            _decrementCounter();
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 41.w),
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
                                      subTitle: "Barley seeds added to bag",
                                      color: HexColor("#28766F"),
                                      isCircle: false,
                                      listener: (status) {
                                        print(status);
                                      },
                                    )..show();
                                  },
                                  child: Text(
                                    "Add to bag",
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
        });
  }

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
}

class Farm {
  final String name;
  final String image;
  final String amount;

  Farm({
    required this.name,
    required this.image,
    required this.amount,
  });
}
