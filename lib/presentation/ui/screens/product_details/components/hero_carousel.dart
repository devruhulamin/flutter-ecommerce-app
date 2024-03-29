import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class HeroCarousel extends StatefulWidget {
  final List<String> urls;
  const HeroCarousel({super.key, required this.urls});

  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  final _currentIdx = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 240.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _currentIdx.value = index;
            },
          ),
          items: widget.urls.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.grey),
                    alignment: Alignment.center,
                    child: Image.network(
                      i,
                      fit: BoxFit.cover,
                    ));
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _currentIdx,
          builder: (context, value, child) {
            return Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...widget.urls.mapIndexed((e, indx) {
                    return Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade500),
                          color: value == e
                              ? AppColors.primaryColor
                              : Colors.white),
                    );
                  }).toList()
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
