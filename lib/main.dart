import 'package:dart_common/dart_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/constants/keys.dart';
import 'package:layout_widgets/src/widgets/navigator_observer.dart';
import 'package:portfolio/settings/setting.dart';
import 'package:portfolio/ui/applayout.dart';
import 'package:portfolio/ui/pages/contact/contact.dart';
import 'package:portfolio/ui/pages/home/home.dart';
import 'package:portfolio/ui/layout/routeTransitions.dart';
import 'package:portfolio/web_supplement.dart';
import 'package:provider/provider.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';
import 'package:ga_simple/ga_simple.dart';

import 'constants/strings.dart';
import 'package:layout_widgets/src/widgets/stateful.dart';


final _D = Logger.filterableLogger(moduleName:'MAIN');

void main() async {
  AppSetting.logDebug = false;
  AppSetting.boxDebug = false;
	WidgetsFlutterBinding.ensureInitialized();
	// -------------------------
  if (IS_MOBILE)  AppSetting.appDirectory = await getApplicationDocumentsDirectory();
  else            AppSetting.appDirectory = null;
  // -------------------------
  runApp(MultiProvider(
    providers: [
      // 1. Wrap MaterialApp with RouteObserverProvider.
      RouteObserverProvider(),
//      ChangeNotifierProvider(create: (BuildContext context) {
//        ValueBuilder();
//      },)
    ],
    child: const App(),
  ));

  mobileFullScreenUX();
  disableLogsInProduction();
}


late GoogleAnalytics? _ga;
GoogleAnalytics get ga{
  return _ga ??= GoogleAnalytics(
    trackingId: "1756949967", analyticsUrl: "http://yesdesign.dynu.net",
    applicationName: "yesdesign_portfolio", applicationVersion: "1.0.0",
    documentDirectory: AppSetting.appDirectory!.path
  );
}

class App extends StatelessWidget {
  static AppNavObserver? _navObserver;
  static AppNavObserver get navObserver {
    return _navObserver ??= AppNavObserver.singleton()..addEventListener((TRouteEvent evt){
      switch(evt.type){
        case ERouteEventType.pop:
          break;
        case ERouteEventType.push:
          ga.sendPageView();
          break;
        case ERouteEventType.remove:
          break;
        case ERouteEventType.replace:
          break;
      }
    });
  }

  static NavHistory? get routeHistory => App.navObserver.history;
//  static List<String> routeHistory = [ROUTE.BLANK];
  const App();


  @override Widget build(BuildContext context) {
		_D.d(()=>'rebuild App');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [RouteObserverProvider.of(context), navObserver],
      navigatorKey: Keys.navigator,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColorBrightness: Brightness.light, // bread menu
          accentColorBrightness: Brightness.light,
      ),
      home: const AppHome(),
      onGenerateRoute: (RouteSettings settings) {
        _D.d(()=>'add route: ${settings.name}');
        /// note:
        ///  must specify settings in every RouteBuilder
        ///  so that NavigatorObserver could catch it's original
        ///  route name, or it will be missed;
        ///
        switch (settings.name) {
          case ROUTE.BLANK:
            return PageRouteBuilder<AppHome>(pageBuilder: (ctx, a1, a2){
              return const AppHome();
            }, settings: settings);
          case ROUTE.HOME:
            return PageRouteBuilder<AppGeneralLayout>(pageBuilder: (ctx, a1, a2){
              return AppGeneralLayout( const HomePage());
            }, settings: settings);
          case ROUTE.CONTACT:
            return SlideRightRoute(
                widget: AppGeneralLayout(const ContactPage()),
                settings: settings
            );
          case ROUTE.PORTFOLIO:
            return PageRouteBuilder<AppGeneralLayout>(pageBuilder: (ctx, a1, a2){
              return AppGeneralLayout( const HomePage(portfolioRoute: true,));
            }, settings: settings);

          default:
            throw Exception('uncaught route: ${settings.name}');
        }
      },
    );
  }
}
// web refinementA comments....
class AppHome extends StatefulWidget {
	const AppHome():super(key: const ValueKey("AppMain"));
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  void initState() {
    super.initState();
  }

  @override Widget build(BuildContext context) {
    _D.w(()=>('rebuild AppHome, history: ${App.routeHistory}'));
    if (App.routeHistory?.isRoot ?? false){
      SchedulerBinding.instance.addPostFrameCallback((_){//Navigator.pushNamed(context, ROUTE.HOME);
        Navigator.of(context).pushNamed(ROUTE.HOME);
      });
    }
    return AppGeneralLayout(Container());
  }
}
