import 'package:dart_common/dart_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/icons/my_flutter_app_icons.dart';
import 'package:portfolio/main.dart';
import 'package:url_launcher/url_launcher.dart';

final _D = Logger.filterableLogger(moduleName:'MENU_I');


class HomeActionItem extends StatelessWidget {
	static bool isOpened(BuildContext context){
		return Scaffold.of(context).isDrawerOpen;
	}

	static void openDrawer(BuildContext context){
		Scaffold.of(context).openDrawer();
	}

	static void routeGuard(String routename, BuildContext ctx, BuildContext context){
		final String current = App.routeHistory?.last?.settings.name ?? "";
		if (routename == current){
			Navigator.of(ctx).pop();
			return;
		}
		if(Scaffold.of(ctx).hasDrawer && Scaffold.of(ctx).isDrawerOpen){
			Navigator.of(ctx).pop();
			Future.delayed(Duration(milliseconds: 200), (){
				Navigator.of(ctx).pushNamed(routename);
			});
		}else{
			Navigator.of(ctx).pushNamed(routename);
		}

		return;
	}

	static List<Widget> getMainItems(BuildContext context,{bool showIcon = true, }) {
		final route = (App.routeHistory?.isNotEmpty ?? false)
			? App.routeHistory!.last ?? ROUTE.HOME
			: ROUTE.HOME;
		final double iconSize = 16;
		_D.d(()=>'getMainItems, route name: $route, showIcon: $showIcon');
		return <Widget>[
			HomeActionItem(
				icon: Icons.home,
				tip:"Navigate to Home Page",
				iconSize: showIcon ? iconSize : 0,
				active: route == ROUTE.HOME,
				text: STRINGS.menu_home,
				onPress: (ctx){
					routeGuard(ROUTE.HOME, ctx, context);
				}),

			HomeActionItem(
					icon: CustomIcons.vuejs,
					tip:"Navigate to portfolio",
					iconSize: showIcon ? iconSize : 0,
					active: route == ROUTE.PORTFOLIO,
					text: STRINGS.menu_portfolio,
					onPress: (ctx){
						routeGuard(ROUTE.PORTFOLIO, ctx, context);
					}),

			HomeActionItem(
					icon: Icons.contact_mail,
					tip:"Navigate to Contact Page",
					iconSize: showIcon ? iconSize : 0,
					active: route == ROUTE.CONTACT,
					text: STRINGS.menu_contact,
					onPress: (ctx){
						routeGuard(ROUTE.CONTACT, ctx, context);
					}),
		];
	}

	final double iconSize;
	final IconData icon;
	final String tip;
	final String text;
	final bool active;
	final void Function(BuildContext) onPress;

	const HomeActionItem({
		required this. iconSize,
		required this. icon,
		required this. tip,
		required this. text,
		required this. onPress,
		required this. active
	});

	@override Widget build(BuildContext context) {
		final Color iconColor = active ? MColors.menuActive : MColors.menuInactive;
		final TextStyle textStyle = active ? TextStyles.menu_item_active : TextStyles.menu_item_deactive;
		return Tooltip(
			message:tip,
			child: MaterialButton(
				child: Center(
					child: Container(
						alignment: AlignmentDirectional.centerStart,
						child: Row(
							mainAxisAlignment: MainAxisAlignment.start,
							children: <Widget>[
								if (iconSize != 0)
									Icon(icon, color: iconColor, size: iconSize),
								SizedBox(width: 10),
								Text(text, style: textStyle,),
							],
						),
					),
				),
				onPressed: () => onPress(context),
			),
		);

	}
}
