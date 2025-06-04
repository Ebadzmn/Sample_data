import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  final List<String> images;
  final double height;

  const CarouselSlider({
    Key? key,
    required this.images,
    this.height = 200,
  }) : super(key: key);

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void onPageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget buildIndicator(int index) {
    bool isActive = index == _currentIndex;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 30 : 20,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: widget.height,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: onPageChange,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    widget.images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, buildIndicator),
        ),
      ],
    );
  }
}
