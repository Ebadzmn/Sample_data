import 'package:flutter/material.dart';
import 'package:sampledata/travel_ui/widget/category_widget.dart';

class TravelUi extends StatefulWidget {
  const TravelUi({super.key});

  @override
  State<TravelUi> createState() => _TravelUiState();
}

class _TravelUiState extends State<TravelUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on ,size: 16,),
                  Text('Location' ,style: TextStyle(fontSize: 14,color: Colors.grey[700],fontWeight: FontWeight.w500),)
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text('Asia, Bangladesh', style: TextStyle(fontSize: 16),),
                  Icon(Icons.arrow_drop_down,size: 20,)
                ],
              )
            ],
          ),
        ),
        toolbarHeight: 90,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Wherever You Go, \nIts Beautiful Place',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            category_widget(),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        width: 230,
                        color: Colors.black,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds ) {
                            return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.grey.withOpacity(0.9),
                                  Colors.transparent
                                ]).createShader(bounds);
                          }, blendMode: BlendMode.dstIn,child: Image.network('https://plus.unsplash.com/premium_photo-1661964149725-fbf14eabd38c?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dG91cmlzdCUyMGF0dHJhY3Rpb258ZW58MHx8MHx8fDA%3D',fit: BoxFit.cover,),),
                      ),
                      Positioned(
                          top: 8,
                          left: 180,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white
                            ),
                            child: Icon(Icons.favorite,color: Colors.red,),
                          )),
                      Positioned(
                          top: 210,
                          child: Row(
                            children: [
                              Icon(Icons.star,color: Colors.blue,),
                              Text('4.5/5.0',style: TextStyle(color: Colors.white),),
                              Text('(40,000)',style: TextStyle(color: Colors.grey),),
                            ],
                          )),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        width: 230,
                        color: Colors.black,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds ) {
                            return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.grey.withOpacity(0.9),
                                  Colors.transparent
                                ]).createShader(bounds);
                          }, blendMode: BlendMode.dstIn,child: Image.network('https://plus.unsplash.com/premium_photo-1661964149725-fbf14eabd38c?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dG91cmlzdCUyMGF0dHJhY3Rpb258ZW58MHx8MHx8fDA%3D',fit: BoxFit.cover,),),
                      ),
                      Positioned(
                          top: 8,
                          left: 180,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white
                            ),
                            child: Icon(Icons.favorite,color: Colors.red,),
                          )),
                      Positioned(
                          top: 210,
                          child: Row(
                            children: [
                              Icon(Icons.star,color: Colors.blue,),
                              Text('4.5/5.0',style: TextStyle(color: Colors.white),),
                              Text('(40,000)',style: TextStyle(color: Colors.grey),),
                            ],
                          )),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        width: 230,
                        color: Colors.black,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds ) {
                            return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.grey.withOpacity(0.9),
                                  Colors.transparent
                                ]).createShader(bounds);
                          }, blendMode: BlendMode.dstIn,child: Image.network('https://plus.unsplash.com/premium_photo-1661964149725-fbf14eabd38c?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dG91cmlzdCUyMGF0dHJhY3Rpb258ZW58MHx8MHx8fDA%3D',fit: BoxFit.cover,),),
                      ),
                      Positioned(
                          top: 8,
                          left: 180,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white
                            ),
                            child: Icon(Icons.favorite,color: Colors.red,),
                          )),
                      Positioned(
                          top: 210,
                          child: Row(
                            children: [
                              Icon(Icons.star,color: Colors.blue,),
                              Text('4.5/5.0',style: TextStyle(color: Colors.white),),
                              Text('(40,000)',style: TextStyle(color: Colors.grey),),
                            ],
                          )),
                    ],
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}


