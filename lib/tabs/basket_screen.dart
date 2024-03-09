import 'package:alisher_exam3/data/local/local_database.dart';
import 'package:alisher_exam3/data/models/allproducts_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  List<ProductsModel> basket = [];

  _init() async {
    basket = await LocalDatabase.getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double pw = MediaQuery.of(context).size.width;
    double ph = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Savatcha"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [

                    ],
                  ),
                )
                // ...List.generate(
                //   basket.length,
                //   (index) => Text(
                //     basket[index].name,
                //     style: TextStyle(color: Colors.red, fontSize: 20.sp),
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            height: ph,
            width: pw,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10.h,),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20.h,
                    left : 20.w,
                    right : 20.w,
                  ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.r)
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0 , 4),
                          spreadRadius: 1,
                          blurRadius: 40,
                          color : Colors.black.withOpacity(0.1)
                        )
                      ]
                    ),
                    padding : EdgeInsets.symmetric(vertical: 10.h),
                    child: Center(child: Text("Umumiy summa ---> 0 sum" , style: TextStyle(
                      fontSize: 20.sp,fontWeight: FontWeight.w700
                    ),),),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
