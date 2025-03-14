import 'package:daily_ui4/constants/my_themes.dart';
import 'package:daily_ui4/data/dummy_data.dart';
import 'package:daily_ui4/screens/about_screen.dart';
import 'package:daily_ui4/screens/activies_screen.dart';
import 'package:daily_ui4/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List pages = [ActiviesScreen(), AboutScreen()];

  int isActive = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double remainingHeight = screenHeight - 340;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedSettings01,
              color: primaryColor,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profilePictureBuilder(),
              CustomDivider(),
              userStatsBuilder(),
              CustomDivider(),
              activitiesAboutButtonBuilder(),
              SizedBox(
                height: remainingHeight,
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      isActive = value;
                    });
                  },
                  physics: NeverScrollableScrollPhysics(),
                  children: [pages[isActive]],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profilePictureBuilder() {
    return SizedBox(
      // color: Colors.grey,
      width: double.infinity,
      height: 190.sp,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: primaryColor,
              child: Container(
                margin: EdgeInsets.all(6),
                clipBehavior: Clip.antiAlias,
                width: 120.sp,
                height: 120.sp,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(user.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8.sp),
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            Text(
              user.role,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userStatsBuilder() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                formatter.format(user.posts),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text('Post', style: TextStyle(color: Colors.grey)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatter.format(user.followers),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('Followers', style: TextStyle(color: Colors.grey)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatter.format(user.following),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('Following', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget activitiesAboutButtonBuilder() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          Flexible(
            child: InkWell(
              onTap: () {
                setState(() {
                  isActive = 0;
                });
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width / 2,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                    bottom: BorderSide(
                      color: isActive == 0 ? primaryColor : Colors.white,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Activities',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: isActive == 0 ? Colors.black : Colors.grey,
                      ),
                    ),
                    SizedBox(width: 4.sp),
                    HugeIcon(
                      icon: Icons.auto_awesome_mosaic,
                      color: isActive == 0 ? primaryColor : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () {
                setState(() {
                  isActive = 1;
                });
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width / 2,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                    bottom: BorderSide(
                      color: isActive == 1 ? primaryColor : Colors.white,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: isActive == 1 ? Colors.black : Colors.grey,
                      ),
                    ),
                    SizedBox(width: 4.sp),
                    HugeIcon(
                      icon: Icons.account_box_rounded,
                      color: isActive == 1 ? primaryColor : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
