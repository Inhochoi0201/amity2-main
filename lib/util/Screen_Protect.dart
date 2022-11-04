import 'package:amity2/util/Import_Package.dart';

class ScreenProtect extends StatelessWidget{
  const ScreenProtect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1000), ()=> Get.back());
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return Material(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}