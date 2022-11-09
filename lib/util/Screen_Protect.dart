import 'package:amity2/util/Import_Package.dart';
import 'package:amity2/view/Body_Language_Solo.dart';


class ScreenProtect extends StatelessWidget{
  const ScreenProtect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1500), ()=> Get.back());
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return Material(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: const Center(
          child: SpinKitRotatingPlain(color: Color(0xffaecdff),)
        ),
      ),
    );
  }
}

class ScreenProtect2 extends StatelessWidget{
  ScreenProtect2({Key? key, required this.isTeam}) : super(key: key);
  bool isTeam;
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1000), (){
      if(isTeam){
        Get.off(()=>BodyLanguageTeam());
      }else{
        Get.off(()=>BodyLanguageSolo());
      }
      });
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    return Material(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: const Center(
          child: SpinKitRotatingPlain(color: Color(0xffaecdff),)
        ),
      ),
    );
  }
}