import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:layout_widgets/layout_widgets.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/ui/layout/menu/menu_item.dart';
import 'package:portfolio/ui/pages/home/home.dart';
import 'package:ui_common_behaviors/ui_common_behaviors.dart';




class ScrollControllerImpl implements ScrollControllerSketch{
	final ScrollController controller;
  @override double get offset => controller.offset;
	ScrollControllerImpl(this.controller);
}



class HomeAppBar  {
	static Color scrimColor = Colors.blueGrey[900]!.withOpacity(0.8);

	static List<Widget> _buildTopMenu(BuildContext context){
		return [
			SizedBox(width: ScreenUtil.largeDesign.setWidth(HomePage.designPaddingLR)),
			_buildLogo(),
			Spacer(),
			..._buildDrawerActionsWithoutSpacing(context, showIcon: false),
			SizedBox(width: ScreenUtil.largeDesign.setWidth(HomePage.designPaddingLR))
		];
	}

	static List<Widget> _buildDrawerActionsWithoutSpacing(BuildContext context,{bool showIcon = true, }) {
		return HomeActionItem.getMainItems(context, showIcon: showIcon);
	}


	static List<Widget> _buildDrawerActions(BuildContext context) {
		return <Widget>[
			Spacer(flex: 1,),
			..._buildDrawerActionsWithoutSpacing(context),
			Spacer(flex: 5,),
		];
	}

	static Widget _buildLogoLarge(){
		return Image.asset(Assets.yesLogo, width: ScreenUtil.getInstance().setWidth(174));
	}
	static Widget _buildLogoMedium(){
		return Image.asset(Assets.yesLogo, width: ScreenUtil.getInstance().setWidth(174));
	}
	static Widget _buildLogo(){
		return Image.asset(Assets.yesLogo, width: 174 * 0.75);
	}

	static Widget? buildDrawer(BuildContext context) {
		return ResponsiveScreen.isSmallScreen(context)
			? Drawer(
				semanticLabel: 'hello',
				elevation: 4,
				child: Container(
					decoration: BoxDecoration(
						gradient: MColors.drawerGradientA,
					),
					child: Column(
						children: _buildDrawerActions(context),
					),
				),
			) : null;
	}


	static const double _sliverBarHeight = 60.0;
	static const double _sliverBarTop = 20.0;
	static const double sliverBarHeight = _sliverBarHeight + _sliverBarTop;

	static Widget buildSliverAppBar(BuildContext context, SliverConstraints _constraints){
		final constraints = BoxConstraints(maxWidth: ScreenUtil.screenWidthDp);
		return SliverAppBar(
			floating: true,
			snap: true,
			elevation: 0,
			backgroundColor: MColors.appBg.withOpacity(0.9),
			expandedHeight: _sliverBarHeight,
			//leading: CustomAppBar.defaultLeading(context),
			flexibleSpace: Padding(
				padding: EdgeInsets.only( top: _sliverBarTop, left: 60),
			  child: Align(
					alignment: Alignment.centerLeft,
			    child: Row(
			    	mainAxisAlignment: MainAxisAlignment.start,
			    	crossAxisAlignment: CrossAxisAlignment.center,
			    	children:[
							ResponsiveScreen(
								key: ValueKey("appBarLogo"),
								constraints: constraints,
								largeScreen : BoundingBox(child: Paddings.homePadding(child: _buildLogoLarge())),
								mediumScreen: BoundingBox(child: Paddings.homePadding(child: _buildLogoMedium())),
								smallScreen : BoundingBox(child: _buildLogo()),
							)
			    ]),
			  ),
			),
			actions: <Widget>[
				if (!ResponsiveScreen.isSmallScreen(context))
					Expanded(
						child: Row(
							mainAxisSize: MainAxisSize.min,
							mainAxisAlignment: MainAxisAlignment.end,
							children:_buildDrawerActionsWithoutSpacing(
								context, showIcon: false)),
					),
				SizedBox(width: ScreenUtil.largeDesign.setWidth(HomePage.designPaddingLR + 50))
			],

		);
	}


	static PreferredSizeWidget buildStaticAppBar(BuildContext context, BoxConstraints constraints) {
		return AppBar(
			titleSpacing: 0.0,
			title: BoundingBox(child: ResponsiveScreen(
				largeScreen : BoundingBox(child: _buildLogoLarge()),
				mediumScreen: BoundingBox(child: _buildLogoMedium()),
				smallScreen : BoundingBox(child: _buildLogo()),
			)),
			backgroundColor: Colors.transparent,
			bottomOpacity: 0,
			elevation: 0.0,
			leading: !ResponsiveScreen.isSmallScreen(context)
				? Container() // clear bread menu
				: null, 			// show default bread menu,
			actions: !ResponsiveScreen.isSmallScreen(context)
					? _buildTopMenu(context)
					: null,
		);
	}

	// @Deprecated("cannot hide appbar by transform method, use sliverAppbar instead")
	// static PreferredSizeWidget buildHiddableAppBar(BuildContext context, BoxConstraints constraints) {
	// 	return HiddableAppBar(
	// 		hideDirection: ScrollDirection.reverse,
	// 		awareness: AppGeneralLayout.scrollAwareness,
	// 		height: 60,
	// 		builder:(leading, ctx){
	// 			return Container(
	// 				constraints: constraints,
	// 				color: Colors.transparent,
	// 				padding: EdgeInsets.only(top:20, bottom:10),
	// 				child: Row(
	// 						mainAxisSize: MainAxisSize.min,
	// 						mainAxisAlignment: MainAxisAlignment.start,
	// 						crossAxisAlignment: CrossAxisAlignment.center,
	// 						children:[
	// 							leading,
	// 							BoundingBox(child: ResponsiveScreen(
	// 								constraints: constraints,
	// 								largeScreen : BoundingBox(child: Paddings.homePadding(child: _buildLogoLarge())),
	// 								mediumScreen: BoundingBox(child: Paddings.homePadding(child: _buildLogoMedium())),
	// 								smallScreen : BoundingBox(child: _buildLogo()),
	// 							)),
	// 							if (!ResponsiveScreen.isSmallScreen(context))
	// 								Expanded(
	// 									child: Row(
	// 											mainAxisSize: MainAxisSize.min,
	// 											mainAxisAlignment: MainAxisAlignment.end,
	// 											children:_buildDrawerActionsWithoutSpacing(context, showIcon: false)),
	// 								),
	// 							SizedBox(width: ScreenUtil.largeDesign.setWidth(HomePage.designPaddingLR + 50))
	// 						]),
	// 			);
	// 	});
	// }
}
