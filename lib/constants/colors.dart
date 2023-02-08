import 'package:flutter/material.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';
import 'package:random_color/random_color.dart';

RandomColor _rc = RandomColor();

class MColors{
	static Color get random => _rc.randomColor();
	static const Color appBg    = Color(0xFFF7F8FA);
	static const Color textDark = Color(0xff4C5154);
	static const Color textDark2 = Color(0xff2F3234);
	static const Color textAccent = Color(0xff00B1C2);
	static const Color textAccentDark = Color(0xff00626E);
	static const Color textLink = Color(0xffDE8000);

	static const Color skillEclipseBg = Color(0xffE3E4E5);
	static const Color skillText = Color(0xff6D7479);
	static const Color skillTitleIcon = Color(0xff828E95);
	static 			 Color socialIcon     = Color(0xff828E95).withOpacity(0.5);
	static const Color audioProgressBg = Color(0xffC9DBE5);

	static const Color menuActive = Color(0xFF50AFC0);
	static const Color menuInactive = Color(0xff7F878C);

	static RadialGradient get drawerGradientA => RadialGradient(
		colors:[MColors.textDark2, MColors.textDark],
		center: AlignmentDirectional.centerEnd,
		radius: ScreenUtil.isPortrait
				? 2
				: 0.8
	);

	static RadialGradient get dialogGradient => RadialGradient(
			colors:[MColors.socialIcon, MColors.skillEclipseBg],
			center: AlignmentDirectional.centerEnd,
			radius: ScreenUtil.isPortrait
					? 2
					: 0.8
	);
}
