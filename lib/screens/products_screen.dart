import 'package:alisher_exam3/data/models/my_repositories.dart';
import 'package:alisher_exam3/data/models/product_model.dart';
import 'package:alisher_exam3/data/network/network_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    super.key,
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}
int activeFavourite = 0;
class _ProductsScreenState extends State<ProductsScreen> {
  final AppRepository appRepository = AppRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title!,
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<NetworkResponse>(
        future: appRepository.getIdProducts(widget.id!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<ProductsModelById> products =
                (snapshot.data as NetworkResponse).data as List<ProductsModelById>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 0.55,
                children: [
                  ...List.generate(
                    products.length,
                    (index) => Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: Colors.black26,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Image.network(
                                    products[index].imageUrl,
                                    width: 120.h,
                                    height: 100.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  products[index].name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "\$${products[index].price.toString()}",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.w.h),
                                    child: Center(
                                      child: Text(
                                        "Savatga qo'shish",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130, bottom: 20),
                          child: IconButton(
                            onPressed: () {
                              activeFavourite = 1;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.favorite_outline_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
