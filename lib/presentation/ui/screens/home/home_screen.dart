import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/category/components/category_item.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/app_bar.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/banner_carousel.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/category_section.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/search_field.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/section_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchFieldHome(),
              const SizedBox(height: 10),
              const BannerCarousel(),
              const SizedBox(height: 10),
              SectionTitle(
                title: 'All Categories',
                onTap: () {},
              ),
              const SizedBox(
                height: 150,
                child: CategorySection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
