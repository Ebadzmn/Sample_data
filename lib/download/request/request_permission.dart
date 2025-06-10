import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermission() async {
  if (await Permission.storage.request().isGranted) {
    print('Permission Ok');
  }
}