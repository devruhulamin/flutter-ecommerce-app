import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/app_bar.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/banner_carousel.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchFieldHome(),
              SizedBox(height: 10),
              BannerCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}
