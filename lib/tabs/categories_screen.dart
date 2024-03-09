import 'package:alisher_exam3/data/models/categories_model.dart';
import 'package:alisher_exam3/data/models/my_repositories.dart';
import 'package:alisher_exam3/data/network/network_response.dart';
import 'package:alisher_exam3/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final AppRepository appRepository = AppRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18.sp),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          FutureBuilder<NetworkResponse>(
            future: appRepository.getAllCategory(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.hasData) {
                List<CategoriesModel> categories =
                    (snapshot.data as NetworkResponse).data as List<CategoriesModel>;
                return Padding(
                  padding:  EdgeInsets.all(8.w.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                          categories.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductsScreen(id: categories[index].id, title: categories[index].name,),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0, 0), // changes x,y position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(12.w.h),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.network(
                                        categories[index].imageUrl,
                                        width: 100,
                                      )),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        categories[index].name,
                                        style:
                                            TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}

