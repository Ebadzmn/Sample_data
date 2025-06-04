import 'dart:ui';

import 'package:flutter/material.dart';

class StackLearn extends StatefulWidget {
  const StackLearn({super.key});

  @override
  State<StackLearn> createState() => _StackLearnState();
}

class _StackLearnState extends State<StackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 210,
                  child: Column(
                    children: [
                      Image.network('https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/primary/ProductShowcasesampleimages/JPEG/Product+Showcase-1.jpg' , width: 200, height: 200,),
                    ],
                  ),
                ),
                Positioned(
                    left: 150,
                top: 5,
                child: blurIcons(),
                ),
                Positioned(
                    top: 140,
                    left: 100,
                    child: ElevatedButton(onPressed: () {}, child: Text('Buy now')))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class blurIcons extends StatelessWidget {
  const blurIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10 ,sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30)
          ),
          child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
        ),
      ),
    );
  }
}
