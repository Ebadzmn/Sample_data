import 'package:flutter/material.dart';
import 'package:sampledata/Movie/ui/carosel_slider.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {


  final List<String> image = [
    'https://wpcdn.us-east-1.vip.tn-cloud.net/www.wbbjtv.com/content/uploads/2023/10/q/t/sight-the-movie-poster-horizontal.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_p2wwUMhPtnScrgxHCwGQvZjj33UXf90AOQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn8f3cKFThjuWsd0re0RhUMOvx1h4abkr3NA&s'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(images: image , height: 200,),
              Positioned(
                  left: 200,
                  top: 50,
                  child: Text('Ebad')),
            ],
          ),
          Text('Ebad')
        ],
      )
    );
  }
}
