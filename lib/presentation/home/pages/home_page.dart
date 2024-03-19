import 'package:flutter/material.dart';
import 'package:siakad_app/core/constants/colors.dart';
import 'package:siakad_app/core/constants/images.dart';
import 'package:siakad_app/presentation/home/widgets/menu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Perkuliahan",
                style: primaryTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          MenuCard(
            label: 'Kartu Hasil\nStudi',
            backgroundColor: const Color(0xff686BFF),
            onPressed: () {},
            imagePath: Images.khs,
          ),
          const SizedBox(height: 40.0),
          MenuCard(
            label: 'Nilai\nMata Kuliah',
            backgroundColor: const Color(0xffFFB023),
            onPressed: () {},
            imagePath: Images.matkul,
          ),
          const SizedBox(height: 40.0),
          MenuCard(
            label: 'Jadwal\nMata Kuliah',
            backgroundColor: const Color(0xffFF68F0),
            onPressed: () {},
            imagePath: Images.jadwal,
          ),
        ],
      ),
    );
  }
}
