import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileNameWidget(),
            SizedBox(
              height: 45.h,
            ),
            const ProfileStatistics(),
            SizedBox(
              height: 29.h,
            ),
            Text(
              "More",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0XFF1A1A1A)),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                width: 343.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.logout_outlined,
                              size: 30.r,
                              color: const Color(0XFF0601B4),
                            ),
                          ),
                          Text(
                            "Log Out",
                            style: GoogleFonts.dmSans(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0XFF555555)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle),
                            child: Icon(
                             CupertinoIcons.shield,
                              size: 30.r,
                              color: const Color(0XFF0601B4),
                            ),
                          ),
                          Text(
                            "Help & Support",
                            style: GoogleFonts.dmSans(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0XFF555555)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    GestureDetector(
                      child: Row(
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle),
                            child: Icon(
                              CupertinoIcons.question,
                              size: 30.r,
                              color: const Color(0XFF0601B4),
                            ),
                          ),
                          Text(
                            "About App",
                            style: GoogleFonts.dmSans(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0XFF555555)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileStatistics extends StatelessWidget {
  const ProfileStatistics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 152.w,
          height: 179.h,
          decoration: BoxDecoration(
              color: Colors.blue[100], borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Unavailable",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: const Color(0XFF1A1A1A)),
              ),
              Text(
                "NGN 5046.57",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.blue[700]),
              ),
              Text(
                "Total Count",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: const Color(0XFF1A1A1A)),
              ),
              Text(
                "24",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.blue[700]),
              ),
            ],
          ),
        ),
        Container(
          width: 152.w,
          height: 179.h,
          decoration: BoxDecoration(
              color: Colors.blue[400], borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Availabe",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Colors.white),
              ),
              Text(
                "NGN 5046.57",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.white),
              ),
              Text(
                "Total Count",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Colors.white),
              ),
              Text(
                "24",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileNameWidget extends StatelessWidget {
  const ProfileNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 27.r,
          child: const Icon(CupertinoIcons.profile_circled),
        ),
        SizedBox(width: 32.78.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ikem Frank",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 30.sp,
                  color: const Color(0XFF1A1A1A)),
            ),
            Text(
              "agent",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 20.sp,
                color: Colors.blue[400],
              ),
            ),
          ],
        )
      ],
    );
  }
}
