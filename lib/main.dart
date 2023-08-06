import 'package:bottom_navigation/value/colors.dart';
import 'package:bottom_navigation/widgets/bottom_navigation_controller.dart';
import 'package:bottom_navigation/widgets/bottom_navigation_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pageW;

  @override
  Widget build(BuildContext context) {
    Get.put<BottomNavigationController>(BottomNavigationController());
    pageW = MediaQuery.of(context).size.width;
    double bottomNavigationBarHeight = pageW * 0.17;
    return Scaffold(
      backgroundColor: AppColors.red50,
      body: Center(),
        bottomNavigationBar:
        _buildCurvedBottomNavigationBar(bottomNavigationBarHeight),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: InkWell(
          onTap: () {
            Get.find<BottomNavigationController>().changePage(2);
          },
          child: Container(
            width: pageW * 0.135,
            height: pageW * 0.135,
            decoration: const BoxDecoration(
              color: Color(0xFF8165FF),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(129, 101, 255, 0.29),
                  blurRadius: 14,
                  spreadRadius: 2,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/explore.svg',
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
    );
  }

  Widget _buildCurvedBottomNavigationBar(bottomNavigationBarHeight) {
    return Container(
      height: bottomNavigationBarHeight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26), topRight: Radius.circular(26)),
        color: Colors.transparent,
        // border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Obx(() => ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(26), topRight: Radius.circular(26)),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: CustomPaint(
            painter: ShapePainter(color: AppColors.white, avatarRadius: 10),
            child: BottomNavigationBar(
              currentIndex:
              Get.find<BottomNavigationController>().currentIndexValue,
              elevation: 0,
              backgroundColor: Colors.transparent,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: [
                _buildBottomNavigationBarItem(
                  iconUrl: 'assets/icons/college.svg',
                  label: "کالج",
                  index: 0,
                ),
                _buildBottomNavigationBarItem(
                  iconUrl: 'assets/icons/conversation.svg',
                  label: "مکالمه",
                  index: 1,
                ),
                _buildBottomNavigationBarItem(
                  iconUrl: '',
                  label: '',
                  index: 2,
                ),
                _buildBottomNavigationBarItem(
                  iconUrl: 'assets/icons/competition.svg',
                  label: "رقابت",
                  index: 3,
                ),
                _buildBottomNavigationBarItem(
                  iconUrl: 'assets/icons/store.svg',
                  label: "فروشگاه",
                  index: 4,
                ),
              ],
              onTap: (index) {
                Get.find<BottomNavigationController>().changePage(index);
              },
            ),
          ),
        ),
      )),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String iconUrl,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 64,
        height: 64,
        child: iconUrl == ''
            ? const SizedBox()
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconUrl,
              width: pageW *0.065,
              height: pageW *0.065,
              color: Get.find<BottomNavigationController>()
                  .currentIndexValue ==
                  index
                  ? AppColors.blue75
                  : AppColors.lightGreyIcon,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'IRANYekan',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.5,
                letterSpacing: 0.28,
                color: Get.find<BottomNavigationController>()
                    .currentIndexValue ==
                    index
                    ? AppColors.blue75
                    : AppColors.lightGreyIcon,
              ),
            ),
          ],
        ),
      ),
      label: '',
    );
  }

}
