import 'dart:ui';

import 'package:amity2/util/Import_Package.dart';
import 'package:amity2/view/Splash.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.428,797.714),
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            textTheme: const TextTheme(
              bodyText2: TextStyle(
                fontFamily: 'One'
              )
            ),
          ),
          home: AppVersion(),
        );
      }
    );
  }
}
