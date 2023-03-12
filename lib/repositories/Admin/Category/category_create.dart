import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/Constants.dart';
import '../../../views/widgets/Button.dart';
import '../../../views/widgets/customTextField.dart';
import 'category_api.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({Key? key}) : super(key: key);

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  TextEditingController categoryNameController = TextEditingController();
  CatApi capi = CatApi();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kLightWhiteColor,
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              Container(
                width: double.infinity.w,
                height: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.r),
                    bottomLeft: Radius.circular(40.r),
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF579BB1),
                      Color(0xFF152238),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40.h,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_sharp,
                        color: kLightWhiteColor,
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Text(
                      'Create New Category',
                      style: GoogleFonts.poppins(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: kLightWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 190.h,
                right: 20.w,
                left: 20.w,
                child: SingleChildScrollView(
                  child: Container(
                    height: 550.h,
                    width: 370.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        33.r,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 150.h,
                        ),
                        customTextField(
                          "Category Name",
                          preIcon: const Icon(
                            Icons.category_outlined,
                          ),
                          false,
                          controller: categoryNameController,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Button(
                          title: 'Create',
                          onPressed: () async {
                            var response = await capi
                                .createCategory(categoryNameController.text);

                            print(response);
                            if (response.toString().contains("message")) {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Category Created Successfully",
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }
                            } else {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      "The value is $response, check fields",
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
