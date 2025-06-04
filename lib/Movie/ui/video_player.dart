import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({super.key});

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://bldcmprod-cdn.toffeelive.com/cdn/live/sony_sports_2_hd/playlist.m3u8?Edge-Cache-Cookie=URLPrefix=aHR0cHM6Ly9ibGRjbXByb2QtY2RuLnRvZmZlZWxpdmUuY29tLw:Expires=1749054075:KeyName=prod_linear:Signature=2f87QbX5A8r_KP6PMolIE5FbM1nhGi6RFcovTLxXQ1mvW9M18HZ-EwDuMORwBHsvp3atvSHBezf1-VNneG-lCA'),
    )..initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _seekBy(Duration offset) {
    final currentPosition = _controller.value.position;
    final duration = _controller.value.duration;

    Duration newPosition = currentPosition + offset;

    if (newPosition < Duration.zero) {
      newPosition = Duration.zero;
    } else if (newPosition > duration) {
      newPosition = duration;
    }

    _controller.seekTo(newPosition);
  }


  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.replay_10),
          onPressed: () => _seekBy(const Duration(seconds: -10)),
        ),
        IconButton(
          icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.forward_10),
          onPressed: () => _seekBy(const Duration(seconds: 10)),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Column(
      children: [
        VideoProgressIndicator(
          _controller,
          allowScrubbing: true,
          colors: VideoProgressColors(
            playedColor: Colors.blue,
            backgroundColor: Colors.grey,
            bufferedColor: Colors.lightBlue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formatDuration(_controller.value.position)),
              Text(_formatDuration(_controller.value.duration)),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration position) {
    final minutes = position.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = position.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            const SizedBox(height: 10),
            _buildProgressBar(),
            _buildControls(),
          ],
        )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
