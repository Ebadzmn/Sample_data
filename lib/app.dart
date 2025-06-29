import 'package:flutter/material.dart';
import 'package:sampledata/Movie/ui/carosel_slider.dart';
import 'package:sampledata/Movie/ui/movie_home.dart';
import 'package:sampledata/Movie/ui/movie_screen.dart';
import 'package:sampledata/Movie/ui/search_screen.dart';
import 'package:sampledata/Movie/ui/slider_screen.dart';
import 'package:sampledata/Movie/ui/video_player.dart';
import 'package:sampledata/api/sample2.dart';
import 'package:sampledata/api/semple.dart';
import 'package:sampledata/design.dart';
import 'package:sampledata/download/ui/download_screen.dart';
import 'package:sampledata/firebase_data/wrapper.dart';
import 'package:sampledata/paidUserHandle/ui/user_Call.dart';
import 'package:sampledata/progress_bar/progress_bar.dart';
import 'package:sampledata/stack_learn.dart';
import 'package:sampledata/travel_ui/screens/home_ui.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Wrapper(),
    );
  }
}
