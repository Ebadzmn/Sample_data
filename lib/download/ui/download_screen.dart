import 'package:flutter/material.dart';
import 'package:sampledata/download/request/download_progress.dart';
import 'package:sampledata/download/request/request_permission.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final TextEditingController _urlController = TextEditingController();
  double progress = 0;

  void startDownload() async {
    final url = _urlController.text.trim();

    if (url.isEmpty || !Uri.parse(url).isAbsolute) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid URL')),
      );
      return;
    }

    await requestPermission();

    await downloadFile(
      url,
          (received, total) {
        setState(() {
          progress = received / total;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download File'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _urlController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter download URL',
              ),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 10),
            Text(
              "${(progress * 100).toStringAsFixed(1)}%",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: startDownload,
              child: Text("Download File"),
            ),
          ],
        ),
      ),
    );
  }
}
