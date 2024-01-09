import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/app_bar.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/banner_carousel.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/category_section.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/search_field.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/section_title.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/widget/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchFieldHome(),
              const SizedBox(height: 8),
              const BannerCarousel(),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'All Categories',
                onTap: () {},
              ),
              const SizedBox(
                height: 120,
                child: CategorySection(),
              ),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'Popular',
                onTap: () {},
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const ProductCard();
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 8,
                        ),
                    itemCount: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
