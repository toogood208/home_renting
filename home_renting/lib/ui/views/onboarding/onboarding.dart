import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_renting/ui/shared/colors.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 140.h),
              SizedBox(
                height: 318.h,
                width: 306.w,
                child: Image.asset(
                  "assets/images/Vector.png",
                ),
              ),
              SizedBox(height: 40.h),
              SizedBox(
                width: 200.w,
                height: 144.h,
                child: Text(
                  "Real Estate Service At Their Peak.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 32.sp,
                    color: neutralColor
                  ),
                ),
              ),
               SizedBox(height: 47.5.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                width: 174.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(240.r)
                ),
                child: Center(
                  child: Text("Next",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),),
                ),

              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
