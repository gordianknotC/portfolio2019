import 'package:flutter/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';
import 'package:layout_widgets/src/widgets/debugs.dart';
import 'package:layout_widgets/src/widgets/responsive_widget.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/icons/my_flutter_app_icons.dart';
import 'package:layout_widgets/src/widgets/stateful.dart';
//import 'package:universal_html/html.dart';
import 'package:url_launcher/url_launcher.dart';

const String _LARGE = 'large';
const String _SMALL = 'small';
const String _SMALL_NOICON = 'small_noicon';
const String _LARGE_NOICON = 'large_noicon';

class HomeFooter extends StatelessWidget {
	final String type;
	const HomeFooter.large(): type = _LARGE;
	const HomeFooter.small(): type = _SMALL;
	const HomeFooter.smallnoIcon(): type = _SMALL_NOICON;
	const HomeFooter.largenoIcon(): type = _LARGE_NOICON;

	static void onEmail(){
		if (IS_MOBILE){
			launch("mailto:dharmareveal@gmail.com?subject=SendFromPortfolioApp&body=Hello");
		}else{
			/// https://mail.google.com/mail/u/0/?view=cm&fs=1&to=someone@example.com&su=SUBJECT&body=BODY&bcc=someone.else@example.com&tf=1
			launch("https://mail.google.com/mail/u/0/?"
					"view=cm&fs=1&"
					"to=dharmareveal@gmail.com&"
					"su=SendFromPortfolioApp&"
					"body=Hello...&"
					"f=1");
		}
	}
	static void onBlogger(){
		launch('https://archetypesnalmaas.blogspot.com/');
	}
	static void onTwitter(){
		launch('https://twitter.com/GDknot');
	}

	static void onLine(BuildContext context){
		final w 		 = ScreenUtil.screenShortestSide * 2/3;
		final radius = w / 5;
		showDialog<void>(
			context: context,
			builder: (BuildContext ctx){
				return Center(
				  child: Container(
						width: w, height: w,
				    child: PhysicalModel(
				    	elevation: 5,
				    	borderRadius: BorderRadius.all(Radius.circular(radius)),
				    	color: Colors.white,
				    	child: Center(child: Image.asset(Assets.barcode, height: w * 3/4)),
				    ),
				  ),
				);
			}
		);
	}
	static void onYesdesign(){
		launch(LINKS.portfolioHome);
	}

	Widget _buildSocialIcon({required IconData icon, Color? color, double? size, void onPress()?}){
		color ??= MColors.socialIcon;
		size ??= 20;
		return BoundingBox(
			child: MaterialButton(
				minWidth: size,
				padding: EdgeInsets.all(0),

				onPressed: onPress,
				child: Icon(icon, color: color, size: size),
			),
		);
	}
	Widget _buildSocialIconsSmall(BuildContext context) {
		return Row(
			mainAxisSize: MainAxisSize.max,
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				const Spacer(),
				_buildSocialIcon(icon:CustomIcons.twitter, onPress: onTwitter),
				_buildSocialIcon(icon:CustomIcons.blogger, onPress: onBlogger, size: 16),
				_buildSocialIcon(icon:CustomIcons.email, onPress: onEmail),
				_buildSocialIcon(icon:CustomIcons.line_icon, onPress: () => onLine(context)),
				_buildSocialIcon(icon:CustomIcons.yeslogoonly, onPress: onYesdesign),
				const Spacer(),
			],
		);
	}

	Widget _buildSocialIconsLarge(BuildContext context){
		return  Flexible(
			fit: FlexFit.loose,
			child: Row(
				mainAxisSize: MainAxisSize.min,
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					const Spacer(),
					_buildSocialIcon(icon:CustomIcons.twitter, onPress: onTwitter),
					_buildSocialIcon(icon:CustomIcons.blogger, onPress: onBlogger, size: 16),
					_buildSocialIcon(icon:CustomIcons.email, onPress: onEmail),
					_buildSocialIcon(icon:CustomIcons.line_icon, onPress: () => onLine(context)),
					_buildSocialIcon(icon:CustomIcons.yeslogoonly, onPress: onYesdesign),
				],
			),
		);
	}

	Widget _buildCopyRightText(BuildContext context) {
		final isSmall = ResponsiveScreen.isSmallScreen(context);
		return Row(
			mainAxisAlignment: isSmall ? MainAxisAlignment.center : MainAxisAlignment.start,
			children: <Widget>[
				Text(
					STRINGS.rights_reserved,
					style: TextStyles.p2.copyWith(
						fontSize: isSmall ? 8 : 10.0,
					),
				),
				Row(children:[
					Text(
						"Flutter",
						style: TextStyles.p2.copyWith(
							fontSize: isSmall ? 8 : 10.0,
							color: MColors.textAccent
						),
					),
				]),
			],
		);
	}

 	@override
	Widget build(BuildContext context) {
		if (type == _LARGE) {
			return Column(
				children: <Widget>[
					Divider(),
					Paddings.homePadding(child: Row(
						mainAxisSize: MainAxisSize.min,
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							Align(
								child: _buildCopyRightText(context),
								alignment: Alignment.centerLeft,
							),
							_buildSocialIconsLarge(context),
						],
					))
				],
			);
		}else if (type == _LARGE_NOICON){
			return Column(
				children: <Widget>[
					Divider(),
					Paddings.homePadding(child: Row(
						mainAxisSize: MainAxisSize.min,
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							Align(
								child: _buildCopyRightText(context),
								alignment: Alignment.centerLeft,
							),
						],
					))
				],
			);
		}else if (type == _SMALL){
			return Column(
				mainAxisSize: MainAxisSize.min,
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children:[
					Divider(),
					_buildCopyRightText(context),
					Paddings.homePadding(child: _buildSocialIconsSmall(context)),
				]);
		}else{
			return Column(
				mainAxisSize: MainAxisSize.min,
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children:[
					Divider(),
					_buildCopyRightText(context),
				]);
		}
	}
}
