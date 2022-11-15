import 'package:amity2/util/Import_Package.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await Firebase.initializeApp();
  runApp(const MyApp());
  if(!await Get.put(AppController()).getVersion()){
    Get.put(DialogController()).updateGuide();
  }
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
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: const TextTheme(
              bodyText2: TextStyle(
                fontFamily: 'One'
              )
            ),
          ),
          home: const Home(),
        );
      }
    );
  }
}
