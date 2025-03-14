import 'package:daily_ui4/constants/my_themes.dart';
import 'package:daily_ui4/data/dummy_data.dart';
import 'package:daily_ui4/widgets/small_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: SmallSpacer()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
              ),
              PopupMenuButton(
                itemBuilder: (context) => [PopupMenuItem(child: Text('Edit'))],
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedMoreHorizontalCircle01,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.sp),
          Text(
            user.about,
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
          ),
          SizedBox(height: 8.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Skills',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
              ),
              PopupMenuButton(
                itemBuilder: (context) => [PopupMenuItem(child: Text('Edit'))],
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedMoreHorizontalCircle01,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.sp),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4.sp,
                crossAxisSpacing: 4.sp,
              ),
              children: [
                ...user.skills.map(
                  (skill) => Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(229, 255, 232, 231),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    // margin: EdgeInsets.all(4.sp),
                    padding: EdgeInsets.all(8.sp),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          skill,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(229, 255, 232, 231),
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.sp),
                    onTap: () {},
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedAddCircle,
                      color: primaryColor,
                      size: 50.sp,
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
}
