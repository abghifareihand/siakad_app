import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siakad_app/core/components/spaces.dart';
import 'package:siakad_app/core/constants/colors.dart';
import 'package:siakad_app/core/constants/images.dart';
import 'package:siakad_app/presentation/dashboard/widgets/nav_bar.dart';
import 'package:siakad_app/presentation/home/pages/home_page.dart';
import 'package:siakad_app/presentation/profile/pages/profile_page.dart';

class DashboardPage extends StatefulWidget {
  final int currentTab;
  const DashboardPage({
    super.key,
    required this.currentTab,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late int _selectedIndex;
  final List<Widget> _pages = [
    const HomePage(),
    const Center(
      child: Text('This Page News'),
    ),
    const Center(
      child: Text('This Page Schedule'),
    ),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.currentTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3949AB),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {},
        child: SvgPicture.asset(
          Images.icScan,
          width: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          child: NavBar(
            pageIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
