import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'assets.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
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
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
           SizedBox(
                    height: 18.h,
                  ),
          Text(
            'Farmer’s Information',
            style: TextStyle(color: HexColor("#424242"), fontSize: 14.sp),
          ),
          SizedBox(
                    height: 6.h,
                  ),
          Container(
              height: 66.h,
              width: 342.w,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  border: Border.all(color: HexColor("#CFD8DC")),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 20.w,
                    ),
                    child: Container(
                      height: 40.w,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: HexColor("#F4ECDC"),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
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
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Timothy M. Okundia',
                    style:
                        TextStyle(
                          fontWeight: FontWeight.w500,
                          color: HexColor("#000000"), fontSize: 14.sp),
                  ),
                ],
              )),
               SizedBox(
                    height: 18.h,
                  ),
              Text(
            'Farmer’s Address',
            style: TextStyle(color: HexColor("#424242"), fontSize: 14.sp),
          ),
           SizedBox(
                    height: 6.h,
                  ),
          Container(
              height: 66.h,
              width: 342.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: HexColor("#CFD8DC")),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child:
                
                 
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        '419, Fowogbaro Street, off Adajo road, Capitol Road, Agege, Agege LGA, Lagos State.',
                        style:
                            TextStyle(
                              fontWeight: FontWeight.w500,
                              color: HexColor("#000000"), fontSize: 14.sp),
                      ),
                    ),
                  ),
               ),
                SizedBox(
                    height: 18.h,
                  ),
                   Text(
            'STATUS',
            style: TextStyle(color: HexColor("#424242"), fontSize: 14.sp),
          ),
          SizedBox(
                    height: 13.h,
                  ),
                   Padding(
                     padding:  EdgeInsets.only(right: 191.w),
                     child: Container(
                              height: 24.h,
                              width: 135.w,
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
                   ),
                   SizedBox(
                    height: 21.h,
                  ),
                   Text(
            'CART ITEMS',
            style: TextStyle(color: HexColor("#424242"), fontSize: 16.sp),
          ),


          Container(
             width: 342.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: HexColor("#CFD8DC")),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),

                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset(Assets.farm),
                        title:  Text(
                          'Barley seeds (pack)',
                          style:
                              TextStyle(
                                fontWeight: FontWeight.w500,
                                color: HexColor("#000000"), fontSize: 14.sp),
                                
                        ),
                        subtitle: Text(
                          '75000 NGN',
                          style:
                              TextStyle(
                                fontWeight: FontWeight.w500,
                                color: HexColor("#C39337"), fontSize: 14.sp),
                        ),

                       
                      ),
                       Divider(),
                       ListTile(
                        leading: Image.asset(Assets.farm2),
                        title:  Text(
                          'Digger',
                          style:
                              TextStyle(
                                fontWeight: FontWeight.w500,
                                color: HexColor("#000000"), fontSize: 14.sp),
                                
                        ),
                        subtitle: Text(
                          '75000 NGN',
                          style:
                              TextStyle(
                                fontWeight: FontWeight.w500,
                                color: HexColor("#C39337"), fontSize: 14.sp),
                        ),

                       
                      ),
                       Divider(),
                       ListTile(
                        leading: Image.asset(Assets.farm,),
                        title:  Text(
                          'Hoe',
                          style:
                              TextStyle(
                                fontWeight: FontWeight.w500,
                                color: HexColor("#000000"), fontSize: 14.sp),
                                
                        ),
                        subtitle: Text(
                          '750 NGN',
                          style:
                              TextStyle(
                                fontWeight: FontWeight.w500,
                                color: HexColor("#C39337"), fontSize: 14.sp),
                        ),

                       
                      ),
                       Divider(),
                       ListTile(
                        leading: Image.asset(Assets.farm4),
                        title:  Text(
                          'Tractor',
                          style:
                              TextStyle(
                                fontWeight: FontWeight.w500,
                                color: HexColor("#000000"), fontSize: 14.sp),
                                
                        ),
                        subtitle: Text(
                          '75000000 NGN',
                          style:
                              TextStyle(
                                fontWeight: FontWeight.w500,
                                color: HexColor("#C39337"), fontSize: 14.sp),
                        ),

                       
                      ),
                       Divider(),
                    ],
                  ),
                  
                  ),
                   SizedBox(
                    height: 18.h,
                  ),
                   Text(
            'COST',
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
              child:
                
                 
                  Center(
                    child: Text(
                      'N7,576,500',
                      style:
                          TextStyle(
                            fontWeight: FontWeight.w500,
                            color: HexColor("#000000"), fontSize: 30.sp),
                    ),
                  ),
               ),
                SizedBox(
                    height: 46.h,
                  ),
                  
                  

          
        ],
      ),
    );
  }
}
