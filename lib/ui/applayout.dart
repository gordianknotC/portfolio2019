//import 'dart:html' as html;
import 'package:ui_common_behaviors/ui_common_behaviors.dart';
import 'package:dart_common/dart_common.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/keys.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';
import 'package:layout_widgets/src/widgets/stateful.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/ui/layout/menu/menu.dart';
import 'package:portfolio/ui/pages/portfolio/portfolio.dart';

final _D = Logger.filterableLogger(moduleName:'AppLAY');


class AppGeneralLayout extends StatelessWidget {
	static double appBarHeight = 60.0;
	static ScrollController scrollController = ScrollController()..addListener((){
		AppGeneralLayout.scrollAwareness.onScroll();
		_D.d(()=>"onscroll, offset: ${scrollAwareness.offset}/${AppGeneralLayout.scrollController.offset}");
	});
	static ScrollAccAware scrollAwareness = ScrollAccAware(
			appBarHeight,ScrollControllerImpl(AppGeneralLayout.scrollController));
	final Widget page;
	const AppGeneralLayout(this.page);
	//Screen Methods:-------------------------------------------------------------

	Widget buildScrollViewForMobile(){
		return CustomScrollView(
			slivers: [
				SliverLayoutBuilder(builder: HomeAppBar.buildSliverAppBar),
				SliverToBoxAdapter(child: page)
			],
		);
	}

	@override
	Widget build(BuildContext context) {
		_D.w(()=>('rebuild applayout'));
		// instantiating ScreenUtil singleton instance, as this will be used throughout
		// the app to get screen size and other stuff
		//ScreenUtil.largeDesign = ScreenUtil.getInstance()..init(context);
		const large = const ScreenUtil.large (sketchWidth: 1600, sketchHeight: 1024);
		const medium = const ScreenUtil.medium(sketchWidth: 1024, sketchHeight: 1024);
		const small = const ScreenUtil.small (sketchWidth: 545,  sketchHeight: 1024);
		ScreenUtil.init(context, large: large, medium: medium, small: small);

		final hasPortfolioSlidingUp = ROUTE.homeRelated.contains(App.routeHistory!.last!.settings.name);

		if (IS_MOBILE){
			return Material(
				color: MColors.appBg,
				child: Scaffold(
					key: Keys.appLayout,
					backgroundColor: Colors.transparent,
					drawerScrimColor: HomeAppBar.scrimColor,
					drawer: HomeAppBar.buildDrawer(context),
					body: hasPortfolioSlidingUp
						? PortfolioPage(buildScrollViewForMobile())
						: buildScrollViewForMobile()
				),
			);
		}else{
			return Material(
				color: MColors.appBg,
				child: Scaffold(
					key: Keys.appLayout,
					backgroundColor: Colors.transparent,
					drawerScrimColor: HomeAppBar.scrimColor,
					appBar: HomeAppBar.buildStaticAppBar(context, BoxConstraints(maxWidth: ScreenUtil.screenWidthDp)) ,
					drawer: HomeAppBar.buildDrawer(context),

					body: hasPortfolioSlidingUp
							? PortfolioPage(page)
							: page,
				),
			);
		}
	}
}
