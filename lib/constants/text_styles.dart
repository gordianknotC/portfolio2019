//import 'dart:html' as html;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';
import 'package:layout_widgets/src/widgets/responsive_widget.dart';
import 'package:layout_widgets/src/widgets/stateful.dart';
import 'package:layout_widgets/src/widgets/tag.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/ui/pages/home/home.dart';
import 'package:portfolio/ui/layout/skillUnit.dart';
//import 'package:universal_html/prefer_sdk/html.dart';
import 'package:url_launcher/url_launcher.dart';

class Paddings{
	static Widget noteDialog (Widget child){
		return Padding(child: child, padding: EdgeInsets.all(
				ScreenUtil.screenShortestSide * 0.1
		));
	}

	static const EdgeInsets zero = const EdgeInsets.all(0);

	static Widget contactUnit({Widget? child}){
		return Padding(
				child: child,
				padding: EdgeInsets.only(bottom: 5));
	}


	static Widget homePadding({Widget? child}){
		return Padding(
				child: child,
				padding: EdgeInsets.symmetric(
					horizontal: (ScreenUtil.getInstance().setWidth(HomePage.designPaddingLR))
				));
	}
	static Widget headline({Widget? child, required BuildContext context}){
		final double v = ResponsiveScreen.isSmallScreen(context)
			? 0
			: ResponsiveScreen.isMediumScreen(context)
					? 50
					: 155;
		return Padding(
			child: child,
			padding: EdgeInsets.only(right: v),
		);
	}

	static Widget aboutMe({Widget? child, required BuildContext context}) => Padding(
		child: child,
		padding: EdgeInsets.only(
			top: ResponsiveScreen.isSmallScreen(context) ? 24.0 : 0.0));

	static Widget summary({Widget? child, required BuildContext context}) => Padding(
			child: child,
			padding: EdgeInsets.only(
				top: ResponsiveScreen.isSmallScreen(context) ? 12.0 : 17.0,
				right: 10 //40
	));


	static Widget homeBodyTop({Widget? child, double? size}) => Padding(
		child: child,
		padding: EdgeInsets.only(top:size ?? 0),
	);

	static Widget motto({Widget? child}){
		return Padding(
			child: child,
			padding: EdgeInsets.only(
					left: 21, right: 20, top:21, bottom: 21)
		);
	}

	static Widget skillIcon({Widget? child}){
		return Padding(
			child: child,
			padding: EdgeInsets.symmetric(horizontal: 4)
		);
	}

	static Widget skillContent({Widget? child}){
		return Padding(
				child: child,
				padding: EdgeInsets.only(
						top: 13, right: ScreenUtil.largeDesign.setWidth(35))
		);
	}

	static const EdgeInsets cloudPadding = EdgeInsets.only(right: CloudStyle.PDR, left: CloudStyle.PDL);
	static Widget cloudContent({Widget? child, bool icon = false}) {
		return Padding(
				child: child,
				padding: cloudPadding
		);
	}

  static Widget cloudTags({Widget? child}) {
		return Padding(
				child: child,
				padding: EdgeInsets.only(top: 17)
		);
	}

	static Widget gallery({Widget? child, BuildContext? context}){
		final space = HomeRCol.imageDesignPaddingR;
		return Padding(
				child: child,
				padding: EdgeInsets.only(
					right: ScreenUtil.largeDesign.setWidth(space),
					top: 50,
				)
		);
	}

	static Widget gallerySmallMedium({Widget? child, BuildContext? context}){
		final space = HomeRCol.imageDesignPaddingR;
		return Padding(
				child: child,
				padding: EdgeInsets.only(
					left: ScreenUtil.largeDesign.setWidth(space),
					right: ScreenUtil.largeDesign.setWidth(space),
					top: 0,
				)
		);
	}

/*
	static Widget skillLayout({Widget? child}) {
		return Padding(
				child: child,
				padding: EdgeInsets.only(top: SkillLayout.paddingTop)
		);
	}
*/
	static Widget skillSection({Widget? child}) {
		return Padding(
				child: child,
				padding: EdgeInsets.only(top: SkillSection.serialPaddingTop, bottom: SkillSection.serialPaddingBottom)
		);
	}
}

class Shiftness{
	static Stack title({required Widget child}){
		return Stack(children:[
			Positioned(child: child, left:0)
		]);
	}
}



TextSpan get comma => TextSpan(text:', ', style: TextStyles.pC,);
TextSpan get end => TextSpan(text:'. ', style: TextStyles.pC,);


TextSpan accentText(String ftext,[ int colorLength = 1]){
	String l, r;
	if (colorLength < 0){
		r = ftext.substring(0, -colorLength);
		l =  ftext.substring(-colorLength);
	}else if (colorLength > 0){
		l = ftext.substring(0, ftext.length - colorLength);
		r = ftext.substring(l.length );
	}else{
		l = ftext;
		r = '';
	}
	return TextSpan(
		children:[
			TextSpan(
				text: l,
				style: TextStyles.bodyBold
			),
			TextSpan(
				text: r,
				style: TextStyles.bodyAccent,
			),
		]
	);
}

TextSpan regularSpanText(String text){
	return TextSpan(
			style: TextStyles.pC,
			text: text
	);
}

class Literal {
	static TextSpan spanBoldP(String text){
		return TextSpan(
				text: text,
				style: TextStyles.bodyBold.copyWith(fontWeight: FontWeight.w600),
		);
	}
	static TextSpan spanItP(String text){
		return TextSpan(
			style: TextStyles.pCIt,
			text: "$text"
		);
	}
	static TextSpan spanP(String text, {Color? color}){
		return TextSpan(
				style: TextStyles.p.copyWith(color: color),
				text: "$text"
		);
	}

	static TextSpan spanP2(String text, {Color? color, double? height, double? fontSize,String? fontFamily}){
		return TextSpan(
				style: TextStyles.p.copyWith(
					fontFamily: fontFamily ?? Fonts.product,
					fontWeight: FontWeight.w200,
					height: height ?? 0.9, color: color, fontSize: fontSize
				),
				text: "$text"
		);
	}

	static TextSpan spanLink(String text, {String link = ""}){
		return TextSpan(
			style: TextStyles.bodyLink,
			children:[
				TextSpan(
					text: "$text",
					recognizer: TapGestureRecognizer()
						..onTap = () {
							//html.window.open(link, null);
							if (!IS_MOBILE && link.isNotEmpty) {
							  launch(link);
							}
						}
				)
			]
		);
	}

	static TextSpan spanAcc(String text){
		return TextSpan(
				style: TextStyles.bodyAccent,
				text: "$text"
		);
	}

	static List<TextSpan> spanAccList(String text){
		return text.split(',').map((m) => Literal.spanAcc(m.trim())).fold<List<TextSpan>>([], (initial, b){
			return initial + [b, Literal.spanP('，')];
		});
	}

	static List<TextSpan> spanLinkList(String text, {List<String>? links}){
		final secs = text.split(',');
		links??=[];
		return List.generate(secs.length, (i) => Literal.spanLink(secs[i].trim(), link: links![i])).fold<List<TextSpan>>([], (initial, b){
			return initial + [b, Literal.spanP(',')];
		});
	}


	static TextSpan spanH3E(String text, Color color, {double? height}){
		return TextSpan(
				style: TextStyles.h3.copyWith(color:color, height: height ?? 1, letterSpacing: 0),
				text: "$text"
		);
	}

	static TextSpan spanH4E(String text, Color color, {double? height, double? fontSize}){
		return TextSpan(
			style: TextStyles.h4.copyWith(
					letterSpacing: 0, fontSize: fontSize, fontFamily: Fonts.Khand,
					color:color, height: height ?? 1),
			text: "$text"
		);
	}

	static TextSpan spanH5E(String text, Color color, {double? height, double fontSize = 15}){
		return TextSpan(
				style: TextStyles.h5.copyWith(
						color:color, height: height ?? 1, fontSize: fontSize
				),
				text: "$text"
		);
	}

	static TextSpan spanH6E(String text, Color color, {double? height, double fontSize = 12}){
		return TextSpan(
				style: TextStyles.h5.copyWith(
						color:color, height: height ?? 1, fontSize: fontSize
				),
				text: "$text"
		);
	}

	static TextSpan spanH5C(String text, Color color, {double? height, double fontSize = 15}){
		return TextSpan(
			style: TextStyles.h5C.copyWith(
					color:color, height: height ?? 1, fontSize: fontSize
			),
			text: "$text"
		);
	}



	static RichText spans(List<InlineSpan> children, {StrutStyle? strutStyle}){
		return RichText(
			strutStyle: strutStyle,
			text: TextSpan(
				children: children)
		);
	}

  static Widget decorp(String subtitle, {double spacing = 3, bool adapt = false, int? refLength, Color?  color}) {
		if (adapt){
			final rl  = (refLength ?? 16) * 3;
			final sl = subtitle.length ;
			spacing = rl / sl; // ignore: parameter_assignments
		}
		return Text(
			subtitle,
			style: TextStyles.p.copyWith(
				fontSize: 8, letterSpacing: spacing,
				height: 0.8, color: color,
			),
		);
	}

	static Widget p (String text, {Color? color}){
		return Text(
			text,
			style: color == null ? TextStyles.p : TextStyles.p.copyWith(color: color),
		);
	}
}


class TextStyles {
  TextStyles._();

	static const TextStyle galleryCateAccent = TextStyle(
		fontFamily: Fonts.Khand,
		color: MColors.textAccent,
		fontSize: 21.0, //22.0
		fontWeight: FontWeight.w400,
		letterSpacing: 1.0,
	);

	static const TextStyle galleryCate = TextStyle(
		fontFamily: Fonts.Khand,
		color: MColors.skillText,
		fontSize: 21.0, //22.0
		fontWeight: FontWeight.w500,
		letterSpacing: 1.0,
	);

  static const TextStyle logo = TextStyle(
        fontFamily: Fonts.product,
        color: Color(0xFF45405B),
        fontSize: 22.0, //22.0
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      );

  static const TextStyle menu_item_deactive = TextStyle(
        fontFamily: Fonts.product,
        fontSize: 13.0, //12,.0
        letterSpacing: 1.0,
        color: MColors.menuInactive,
      );

	static TextStyle get menu_item_active => menu_item_deactive.copyWith(color: MColors.menuActive);

  static const TextStyle h2 = TextStyle(
        fontFamily: Fonts.Khand,
        color: Color(0xFF45405B),
        fontSize: 45.0, //45.0
        fontWeight: FontWeight.w500,
        letterSpacing: 1.0,
				textBaseline: TextBaseline.ideographic,
				height:0.9,
      );

	static const TextStyle h2C = TextStyle(
		fontFamily: Fonts.Noto,
		color: Color(0xFF45405B),
		fontSize: 45.0, //45.0
		fontWeight: FontWeight.w500,
		letterSpacing: 1.0,
		textBaseline: TextBaseline.ideographic,
		height:1,
	);

	static const TextStyle h3 = TextStyle(
		color: Color(0xFF45405B),
		fontFamily: Fonts.Khand,
		fontSize: 28.0, //17.0
		fontWeight: FontWeight.w500,
		letterSpacing: 0.9,
	);


	static const TextStyle h4 = TextStyle(
		color: Color(0xFF45405B),
		fontFamily: Fonts.Khand,
		fontSize: 24.0, //17.0
		fontWeight: FontWeight.w500,
		letterSpacing: 0.9,
	);

  static const TextStyle h5 = TextStyle(
        color: Color(0xFF45405B),
        fontFamily: Fonts.Khand,
        fontSize: 15.0, //17.0
				fontWeight: FontWeight.w500,
        letterSpacing: 0.9,
      );

	static const TextStyle h5C = TextStyle(
		color: Color(0xFF45405B),
		fontFamily: Fonts.Noto,
		fontSize: 15.0, //17.0
		letterSpacing: 1.2,
		fontWeight: FontWeight.w500,
	);

	static const TextStyle h5CIt = TextStyle(
		color: Color(0xFF45405B),
		fontFamily: Fonts.Noto,
		fontSize: 15.0, //17.0
		letterSpacing: 1,
		fontWeight: FontWeight.w500,
		fontStyle: FontStyle.italic,
	);

  static const TextStyle company = TextStyle(
    fontFamily: Fonts.product,
    color: Color(0xFF45405B),
    height: 1.5,
    fontSize: 15.0, //15.0
    letterSpacing: 1.0,
  );

	static const TextStyle p = TextStyle(
		fontFamily: Fonts.product,
		color: MColors.textDark,
		height: 1.4,
		fontSize: 12.0, //12.0
		letterSpacing: 0.85,
		fontWeight: FontWeight.w200,
	);

	static const TextStyle pC = TextStyle(
		fontFamily: Fonts.Noto,
		color: MColors.textDark,
		height: 1.4,
		fontSize: 12.0, //12.0
		letterSpacing: 0.85,
		fontWeight: FontWeight.w200,
	);

	static const TextStyle pCIt = TextStyle(
		fontFamily: Fonts.Noto,
		color: MColors.textDark,
		height: 1.4,
		fontSize: 12.0, //12.0
		letterSpacing: 0.85,
		fontStyle: FontStyle.italic,
		fontWeight: FontWeight.w200,
	);

  static const TextStyle p2 = TextStyle(
    fontFamily: Fonts.product,
    color: Color(0xFF85819C),
    height: 1.4,
    fontSize: 10.0, //10.0
    letterSpacing: 1.0,
  );

	static const TextStyle bodyBold = TextStyle(
		fontFamily: Fonts.Noto,
		color: MColors.textDark,
		height: 1.5,
		fontSize: 12.0, //10.0
		letterSpacing: 1.0,
		fontWeight: FontWeight.w500,
	);

	static const TextStyle bodyAccent = TextStyle(
		fontFamily: Fonts.Noto,
		color: MColors.textLink,
		height: 1.5,
		fontSize: 12.0, //10.0
		letterSpacing: 1.0,
		fontWeight: FontWeight.w500,
	);

	static const TextStyle bodyLink = TextStyle(
		fontFamily: Fonts.Noto,
		color: MColors.textLink,
		height: 1.5,
		fontSize: 12.0, //10.0
		letterSpacing: 1.0,
		fontWeight: FontWeight.w500,
	);

	static const TextStyle chip = TextStyle(
    fontFamily: Fonts.product,
    color: Color(0xFF85819C),
    height: 1.5,
    fontSize: 12.0, //12.0
    letterSpacing: 1.0,
  );
}
