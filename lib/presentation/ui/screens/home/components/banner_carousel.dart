import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ruhulaminjr/data/model/slider_product.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  final List<BannerProduct> products;
  const BannerCarousel({super.key, required this.products});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final _currentIdx = ValueNotifier<int>(1);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _currentIdx.value = index + 1;
            },
          ),
          items: widget.products.map((product) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      product.image ??
                          'https://img.freepik.com/free-vector/illustration-gallery-icon_53876-27002.jpg',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title ?? "No Title Found",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColors.primaryColor),
                              onPressed: () {},
                              child: const Text('Buy Now')),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _currentIdx,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...widget.products.map((e) {
                  return Container(
                    width: 16,
                    height: 16,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade500),
                        color: value == e.id
                            ? AppColors.primaryColor
                            : Colors.white),
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
