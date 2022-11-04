import 'package:amity2/util/Import_Package.dart';
import 'package:amity2/view/Body_Language_Team.dart';

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

class ScreenProtect2 extends StatelessWidget{
  const ScreenProtect2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1000), ()=> Get.off(BodyLanguageTeam()));
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
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