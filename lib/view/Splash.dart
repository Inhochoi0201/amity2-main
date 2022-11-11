import 'dart:io';

import 'package:amity2/util/Import_Package.dart';
class Splash extends StatelessWidget {
   const Splash({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Home(),
      duration: 2000,
      imageSize: 130,
      imageSrc: "assets/images/whale.gif",
      text: "Play With Amity",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
          fontSize: 40.sp
      ),
      colors: const[
        Color(0xffB0E0E6),
        Color(0xff87CEEB),
        Color(0xffaecdff),
        Color(0xff6495ED),
        Color(0xff4169E1),
        Color(0xff0000CD),
        Color(0xff000080),
      ],
      backgroundColor: Colors.white,
    );
  }
}
class AppVersion extends StatelessWidget {
  AppVersion({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppVersionController());
    //controller.initialized;
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitRing(color: const Color(0xffaecdff), size: 30.r,),
          SizedBox(height: 10.h,),
         Text( '버전정보 확인 중..', style: TextStyle(fontSize: 15.sp, color:const  Color(0xffaecdff),),),
          SizedBox(height: 30.h,),
          Obx(() => Text('Ver. ${controller.version}'))
        ],
      ),
    );
  }
}

class AppVersionController extends GetxController{
  @override
  void onReady() {
    // TODO: implement onInit
    super.onInit();
    getVersion().then((value) => value ? Get.to(()=> const Splash()) : Get.put(DialogController()).updateGuide());
  }

  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  RxString minAppVersion = ''.obs;
  RxString latestAppVersion = ''.obs;
  RxString version = ''.obs;
  RxString buildNumber = ''.obs;
  Future<bool> getVersion() async{
    await remoteConfig.fetch();
    await remoteConfig.activate();
    minAppVersion.value = remoteConfig.getString('min_version');
    latestAppVersion.value = remoteConfig.getString('latest_version');

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    version.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;

    if(int.parse(version.value) < int.parse(latestAppVersion.value)){
      return false;
    }
    return true;
  }

}