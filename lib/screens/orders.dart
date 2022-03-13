import 'package:agro/screens/place_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'assets.dart';
import 'order_summary.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  PageController? _pageController;

  bool? stylePageController;

  @override
  void initState() {
    super.initState();
    stylePageController = false;
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 1.0,
    );
  }

  bool button = true;
  bool button2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#F5F7FB"),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            SizedBox(
              height: 52.h,
            ),
            Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(Assets.logo)),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 342.w,
              height: 167.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.0),
                  topLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                  bottomLeft: Radius.circular(24.0),
                ),
                image: DecorationImage(
                  image: AssetImage(Assets.cover),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
                      onTap: (){
                                                HapticFeedback.heavyImpact();
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(builder: (_) =>  PlaceOrder()),
              );
                      },
              child: Container(
                  height: 57,
                  width: 57,
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      border: Border.all(color: HexColor("#CFD8DC")),
                      borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(
                      'Place order',
                      style: TextStyle(color: HexColor("#28766F"), fontSize: 24),
                    ),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                width: 342.w,
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    border: Border.all(color: HexColor("#CFD8DC")),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            HapticFeedback.heavyImpact();
                            _pageController!.jumpToPage(0);
                            setState(() {
                              button = true;
                              button2 = false;
                            });
                          },
                          child: Container(
                            width: 156.w,
                            decoration: BoxDecoration(
                                color: button == false
                                    ? Colors.transparent
                                    : HexColor("#28766F"),
                                border: Border.all(color: HexColor("#CFD8DC")),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.5.w, vertical: 9.w),
                              child: Text(
                                'Ongoing Orders',
                                style: TextStyle(
                                    color: button == false
                                        ? HexColor("#AFAFAF")
                                        : Colors.white,
                                    fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _pageController!.jumpToPage(1);
                            HapticFeedback.heavyImpact();
                            setState(() {
                              button2 = true;
                              button = false;
                            });
                          },
                          child: Container(
                            width: 156.w,
                            height: 39.h,
                            decoration: BoxDecoration(
                                color: button2 == false
                                    ? Colors.transparent
                                    : HexColor("#28766F"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.5.w, vertical: 9.w),
                                child: Text(
                                  'Placed Orders',
                                  style: TextStyle(
                                      color: button2 == false
                                          ? HexColor("#AFAFAF")
                                          : Colors.white,
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 24.h),
            SizedBox(height: 15.h),
            Container(
              height: 400.h,
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ongoing(context),
                  placed(context),
                ],
              ),
            ),
          ],
        ));
  }

  Widget ongoing(BuildContext context) {
    return Container(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
      children: [
        Container(
          width: 342.w,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: HexColor("#CFD8DC")),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
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
                          Container(
                            height: 59.w,
                            width: 59.w,
                            decoration: BoxDecoration(
                                color: HexColor("#F4ECDC"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            child: Center(
                              child: Text(
                                'FA',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: HexColor("#000000"),
                                    fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Femi Akilapa',
                            style: TextStyle(
                                color: HexColor("#000000"), fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 7.w,
                          ),
                          Container(
                            height: 24.h,
                            width: 143.w,
                            decoration: BoxDecoration(
                                color: HexColor("#F10083"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            child: Center(
                              child: Text(
                                'Awaiting Payment',
                                style: TextStyle(
                                    color: HexColor("#FFFFFF"),
                                    fontSize: 12.sp),
                              ),
                            ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cost',
                            style: TextStyle(
                                color: HexColor("#37474F"), fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'N35,000',
                            style: TextStyle(
                                color: HexColor("#000000"), fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: HexColor("#CFD8DC")),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0.w, vertical: 5.w),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                      color: HexColor("#28766F"),
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
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
        SizedBox(
          height: 4.h,
        ),
        Container(
          width: 342.w,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: HexColor("#CFD8DC")),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                          Container(
                            height: 59.w,
                            width: 59.w,
                            decoration: BoxDecoration(
                                color: HexColor("#E8EAF6"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            child: Center(
                              child: Text(
                                'PE',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: HexColor("#000000"),
                                    fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Patience Edowoh',
                            style: TextStyle(
                                color: HexColor("#000000"), fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 7.w,
                          ),
                          Container(
                            height: 24.h,
                            width: 110.w,
                            decoration: BoxDecoration(
                                color: HexColor("#B16B00"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            child: Center(
                              child: Text(
                                'Inputs in cart',
                                style: TextStyle(
                                    color: HexColor("#FFFFFF"),
                                    fontSize: 12.sp),
                              ),
                            ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cost',
                            style: TextStyle(
                                color: HexColor("#37474F"), fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'N35,000',
                            style: TextStyle(
                                color: HexColor("#000000"), fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: HexColor("#CFD8DC")),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0.w, vertical: 5.w),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                      color: HexColor("#28766F"),
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
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
        SizedBox(
          height: 4.h,
        ),
      ],
    ));
  }

  Widget placed(BuildContext context) {
    return Container(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
      children: [
        Container(
          width: 342.w,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: HexColor("#CFD8DC")),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
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
                          Container(
                            height: 59.w,
                            width: 59.w,
                            decoration: BoxDecoration(
                                color: HexColor("#FAE2F1"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            child: Center(
                              child: Text(
                                'MO',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: HexColor("#000000"),
                                    fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mudashiru Obasa',
                            style: TextStyle(
                                color: HexColor("#000000"), fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 7.w,
                          ),
                          Container(
                            height: 24.h,
                            width: 137.w,
                            decoration: BoxDecoration(
                                color: HexColor("#F10083"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            child: Center(
                              child: Text(
                                'Order in Progress',
                                style: TextStyle(
                                    color: HexColor("#FFFFFF"),
                                    fontSize: 12.sp),
                              ),
                            ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cost',
                            style: TextStyle(
                                color: HexColor("#37474F"), fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'N35,000',
                            style: TextStyle(
                                color: HexColor("#000000"), fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(

                            onTap: (){
                                                HapticFeedback.heavyImpact();
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute(builder: (_) => const OrderSummary()),
              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: HexColor("#CFD8DC")),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0.w, vertical: 5.w),
                                  child: Text(
                                    'View',
                                    style: TextStyle(
                                        color: HexColor("#28766F"),
                                        fontSize: 14.sp),
                                  ),
                                ),
                              ),
                            ),
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
        SizedBox(
          height: 4.h,
        ),
        Container(
          width: 342.w,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: HexColor("#CFD8DC")),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                          Container(
                            height: 59.w,
                            width: 59.w,
                            decoration: BoxDecoration(
                                color: HexColor("#E8EAF6"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            child: Center(
                              child: Text(
                                'TO',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: HexColor("#000000"),
                                    fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Timothy M. Okundia',
                            style: TextStyle(
                                color: HexColor("#000000"), fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 7.w,
                          ),
                          Container(
                            height: 24.h,
                            width: 155.w,
                            decoration: BoxDecoration(
                                color: HexColor("#673AB7"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            child: Center(
                              child: Text(
                                'Payment Confirmed',
                                style: TextStyle(
                                    color: HexColor("#FFFFFF"),
                                    fontSize: 12.sp),
                              ),
                            ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cost',
                            style: TextStyle(
                                color: HexColor("#37474F"), fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'N35,000',
                            style: TextStyle(
                                color: HexColor("#000000"), fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: HexColor("#CFD8DC")),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0.w, vertical: 5.w),
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                      color: HexColor("#28766F"),
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
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
        SizedBox(
          height: 4.h,
        ),
      ],
    ));
  }
}
