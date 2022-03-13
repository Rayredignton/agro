import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'assets.dart';
import 'select_input.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({ Key? key }) : super(key: key);

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HapticFeedback.heavyImpact();
            Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            SelectInput(
                                                              
                                                            )));
        },
        child: Icon(
          Icons.add,
          size: 21.sp,
        ),
        elevation: 1.0,
        backgroundColor: HexColor("#28766F"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.r))),
      ),

       backgroundColor: HexColor("#F5F7FB"),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leadingWidth: 60.w,
         backgroundColor: Colors.transparent,
        
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Order Details',
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
          padding:  EdgeInsets.only(right: 24.w),
          child: Container(
            width: 40.w,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor("#CFD8DC")),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
              child:SvgPicture.asset(Assets.search),
            ),
          ),
        ),
        ],

      ),
      body: ListView(
           padding: EdgeInsets.symmetric(horizontal: 24.w),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children:[
               SizedBox(
                    height: 39.5.h,
                  ),
          Text(
            'Select farmer',
            style: TextStyle(color: HexColor("#424242"), fontSize: 14.sp),
          ),
          SizedBox(
                    height: 13.h,
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
                          Row(
                            children: [
                              SvgPicture.asset(Assets.loc),
                                SizedBox(
                            width: 7.w,
                          ),
                              Text(
                            'Papa, Ogun State',
                            style: TextStyle(
                                color: HexColor("#616161"), fontSize: 14.sp),
                          ),
                            ],
                          )
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
                            'Grains for Inspection',
                            style: TextStyle(
                                color: HexColor("#37474F"), fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '5 Grains',
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
                                  'Select',
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
                    height: 3.h,
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
                                'DA',
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
                            'David Adetilewa',
                            style: TextStyle(
                                color: HexColor("#000000"), fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 7.w,
                          ),
                           Row(
                            children: [
                              SvgPicture.asset(Assets.loc),
                                SizedBox(
                            width: 7.w,
                          ),
                              Text(
                            'Papa, Ogun State',
                            style: TextStyle(
                                color: HexColor("#616161"), fontSize: 14.sp),
                          ),
                            ],
                          )
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
                            'Grains for Inspection',
                            style: TextStyle(
                                color: HexColor("#37474F"), fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '5 Grains',
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
                                  'Select',
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
                    height: 3.h,
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
                                color: HexColor("#FFF8E1"),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            child: Center(
                              child: Text(
                                'QA',
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
                            'Olabisi Adeyinka',
                            style: TextStyle(
                                color: HexColor("#000000"), fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 7.w,
                          ),
                            Row(
                            children: [
                              SvgPicture.asset(Assets.loc),
                                SizedBox(
                            width: 7.w,
                          ),
                              Text(
                            'Ilaro, Ogun State',
                            style: TextStyle(
                                color: HexColor("#616161"), fontSize: 14.sp),
                          ),
                            ],
                          )
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
                            'Grains for Inspection',
                            style: TextStyle(
                                color: HexColor("#37474F"), fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '5 Grains',
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
                                  'Select',
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
                    height: 3.h,
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
                                color: HexColor("#E0F2ED"),
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
                            'Moses Onofeghara',
                            style: TextStyle(
                                color: HexColor("#000000"), fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 7.w,
                          ),
                           Row(
                            children: [
                              SvgPicture.asset(Assets.loc),
                                SizedBox(
                            width: 7.w,
                          ),
                              Text(
                            'Ilaro, Ogun State',
                            style: TextStyle(
                                color: HexColor("#616161"), fontSize: 14.sp),
                          ),
                            ],
                          )
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
                            'Grains for Inspection',
                            style: TextStyle(
                                color: HexColor("#37474F"), fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '5 Grains',
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
                                  'Select',
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
                    height: 3.h,
                  ),
        ]
      ),
      
    );
  }
}