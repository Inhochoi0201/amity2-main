import 'package:amity2/util/Import_Package.dart';

class AppController extends GetxController{
  RxString minAppVersion = ''.obs;
  RxString latestAppVersion = ''.obs;
  RxString version = ''.obs;
  RxString buildNumber = ''.obs;

  Future<bool> getVersion() async{
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetch();
    await remoteConfig.activate();
    minAppVersion.value = remoteConfig.getString('min_version');
    latestAppVersion.value = remoteConfig.getString('latest_version');

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    version.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
    if(version.value != latestAppVersion.value){
      return false;
    }
    return true;
  }

}