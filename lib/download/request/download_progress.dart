import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

Future<void> downloadFile(String url, Function(int, int) onReceiveProgress) async {
  final dir = await getApplicationDocumentsDirectory();
  final savePath = '${dir.path}/${url.split('/').last}';

  await Dio().download(
    url,
    savePath,
    onReceiveProgress: onReceiveProgress,
    options: Options(responseType: ResponseType.bytes)
  );
  print('Download to: $savePath');
}