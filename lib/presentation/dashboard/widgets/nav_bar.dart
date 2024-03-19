import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siakad_app/core/constants/colors.dart';
import 'package:siakad_app/core/constants/images.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      child: Row(
        children: [
          navItem(
            Images.icHome,
            pageIndex == 0,
            onTap: () => onTap(0),
          ),
          navItem(
            Images.icNews,
            pageIndex == 1,
            onTap: () => onTap(1),
          ),
          const SizedBox(width: 80),
          navItem(
            Images.icSchedule,
            pageIndex == 2,
            onTap: () => onTap(2),
          ),
          navItem(
            Images.icProfile,
            pageIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }

  Widget navItem(String icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          icon,
          colorFilter: !selected
              ? const ColorFilter.mode(
                  AppColor.grey,
                  BlendMode.srcIn,
                )
              : null,
        ),
      ),
    );
  }
}
