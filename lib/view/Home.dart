import 'package:amity2/util/Import_Package.dart';


class Home extends StatelessWidget {
   const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: TitleScrollNavigation(
          bodyStyle:  const NavigationBodyStyle(
            physics: ClampingScrollPhysics()
          ),
          identiferStyle:  NavigationIdentiferStyle(
            color: const Color(0xffaecdff),
            width: 4.w,
          ),
          barStyle:  TitleNavigationBarStyle(
            activeColor: const Color(0xffaecdff),
            style:   TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),
            padding: EdgeInsets.fromLTRB(40.w,40.h,40.w,20.h),
            spaceBetween: 40.w,
          ),
          pages: [
            WordGameSetting(),
            BombGameSetting(),
            BodyLanguageSetting(),
            LylicsGameSetting(),
            const AppInformation()
          ],
          titles: const [
            '초성게임',
            '폭탄게임',
            '몸으로 말해요',
            '가요능력평가',
            '앱 정보'
          ],
        ),
      )
    );
  }
}
