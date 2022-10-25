import 'package:app_financeiro/layout/widget/bar_item_widget.dart';
import 'package:app_financeiro/utils/colors.dart';
import 'package:app_financeiro/utils/constants.dart';
import 'package:flutter/material.dart';

class RootLayout extends StatefulWidget {
  const RootLayout({super.key});

  @override
  State<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends State<RootLayout> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void changePage(int index) {
    pageController.jumpToPage(index);
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: screen,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            border: const Border(
              top: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BarItemWidget(
                icon: Icons.home_outlined,
                isSelected: currentPage == 0,
                onTap: () {
                  changePage(0);
                },
              ),
              BarItemWidget(
                icon: Icons.transfer_within_a_station_outlined,
                isSelected: currentPage == 1,
                onTap: () {
                  changePage(1);
                },
              ),
              BarItemWidget(
                icon: Icons.graphic_eq_outlined,
                isSelected: currentPage == 2,
                onTap: () {
                  changePage(2);
                },
              ),
              BarItemWidget(
                icon: Icons.account_circle_outlined,
                isSelected: currentPage == 3,
                onTap: () {
                  changePage(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
