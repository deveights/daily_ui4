import 'package:daily_ui4/constants/my_themes.dart';
import 'package:daily_ui4/data/dummy_data.dart';
import 'package:daily_ui4/widgets/small_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class ActiviesScreen extends StatefulWidget {
  const ActiviesScreen({super.key});

  @override
  State<ActiviesScreen> createState() => _ActiviesScreenState();
}

class _ActiviesScreenState extends State<ActiviesScreen> {
  final List<String> activityOptions = [
    'Posts',
    'Tagged',
    'Liked',
    'Interested',
  ];

  String activeButton = 'Posts';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SmallSpacer(),
            activityTabsBuilder(),
            SizedBox(height: 12.sp),
            ...posts.map(
              (post) => Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 27.sp,
                        backgroundColor: primaryColor,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          width: 50.sp,
                          height: 50.sp,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            'assets/dp.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.sp),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.name,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            post.datePosted,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      PopupMenuButton(
                        itemBuilder:
                            (context) => [PopupMenuItem(child: Text('Edit'))],
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedMoreHorizontalCircle01,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.sp),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(post.image),
                  ),
                  SizedBox(height: 16.sp),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget activityTabsBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...activityOptions.map(
          (option) => InkWell(
            onTap: () {
              setState(() {
                activeButton = option;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 14.sp),
              height: 28.sp,
              decoration: BoxDecoration(
                color: activeButton != option ? Colors.white : primaryColor,
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 180, 180),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4.sp),
              ),
              child: FittedBox(
                child: Text(
                  option,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: activeButton != option ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
