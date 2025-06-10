import 'package:flutter/material.dart';

class Design extends StatefulWidget {
  const Design({super.key});

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.darken, // or try BlendMode.srcATop, etc.
              child: Image.network(
                'https://t4.ftcdn.net/jpg/06/23/51/33/360_F_623513339_6aCi0QCatsTlrPiRibFxCTMusumNiCf0.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                ElevatedButton(onPressed: () {}, child: Text('Button1')),
                ElevatedButton(onPressed: () {}, child: Text('Button2')),
                            ],
                          ),
              ))
        ],
      )
    );
  }
}
