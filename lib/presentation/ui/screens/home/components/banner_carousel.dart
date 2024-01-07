import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final _currentIdx = ValueNotifier<int>(0);
  final dummy = [0, 1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _currentIdx.value = index;
            },
          ),
          items: dummy.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(color: Colors.amber),
                    alignment: Alignment.center,
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _currentIdx,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...dummy.map((e) {
                  return Container(
                    width: 16,
                    height: 16,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade500),
                        color:
                            value == e ? AppColors.primaryColor : Colors.white),
                  );
                }).toList()
              ],
            );
          },
        ),
      ],
    );
  }
}
