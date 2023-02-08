


import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/icons/my_flutter_app_icons.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';

class Dialogs{
	static Widget Function(BuildContext) noteSquareBuilder(List<Widget> children, {double maxSide = double.infinity}){
		final w 		 = min(ScreenUtil.screenShortestSide * 2/3, maxSide);
		final radius = w / 5;
		return (BuildContext ctx){
			return Center(
				child: Container(
					constraints: BoxConstraints(
						maxWidth: maxSide, maxHeight: maxSide
					),
					width: w, height: w,
					child: PhysicalModel(
						elevation: 5,
						borderRadius: BorderRadius.all(Radius.circular(radius)),
						color: Colors.white,
						child: Paddings.noteDialog(Column(
								mainAxisAlignment: MainAxisAlignment.center,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: children)),
					),
				),
			);
		};
	}

	static Widget Function(BuildContext) noteRectBuilder(List<Widget> children, {double maxSide = double.infinity}){
		final l 		 = min(ScreenUtil.screenLongestSide * 1/2, maxSide);
		final radius = l / 5;
		final h = ScreenUtil.isPortrait ? l : ScreenUtil.screenHeightDp * 2/3;
		final w = ScreenUtil.isPortrait ?      ScreenUtil.screenWidthDp * 2/3 : l;
		return (BuildContext ctx){
			return Center(
				child: Container(
					constraints: BoxConstraints(
						maxWidth: maxSide, maxHeight: maxSide,
					),
					width: w, height: h,
					child: PhysicalModel(
						elevation: 5,
						borderRadius: BorderRadius.all(Radius.circular(radius)),
						color: Colors.white,
						child: Paddings.noteDialog(Column(
								mainAxisAlignment: MainAxisAlignment.center,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: children)),
					),
				),
			);
		};
	}
}
