import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 80.sp, color: Colors.blue),
            SizedBox(height: 20.h),
            Text(
              tr("title"),
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              "user@example.com",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
            ),
            SizedBox(height: 30.h),
            ElevatedButton.icon(
              icon: Icon(Icons.logout),
              label: Text("Logout"),
              onPressed: () {
                // Бұл жерде шығыс немесе басқа әрекеттерді қоса аласың
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Logged out")),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
