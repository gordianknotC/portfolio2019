import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';
import 'package:layout_widgets/src/screen/dim.dart';
import 'package:portfolio/ui/layout/menu/menu.dart';


class ContactDim{
//	static TDims pagePadding = TDims(
//		large: TDim(width: 129, adaptive: true),
//	);

	static TDims appbar = TDims(
			defaults: TDim(height: HomeAppBar.sliverBarHeight)
	);

	///
	///   L - C O L
	///
	static TDims lcol = TDims(
		small: TDim(width: 457, height: 678),
		medium: TDim(width: 506),
		large: TDim(width: 701),

	);

	static TDims spaceman = TDims(
		defaults: TDim(width: 330, height: 337, adaptive: false),
	);
	static TDims avatar = TDims(
		defaults: TDim(width: 162, height: 162, padding:EdgeInsets.only(top: 50) , adaptive: false),
	);
	static TDims avatarTitle = TDims(
		defaults	: TDim(width: 162, height: 162, padding: EdgeInsets.only(top: 34), top: 282, adaptive: false),
	);
	static TDims avatarMoto = TDims(
		defaults	: TDim(width: 215, padding: EdgeInsets.only(top: 10), adaptive: false),
	);

	///
	/// 	M - C O L
	///
	static TDims mcol = TDims(
		defaults: TDim(padding: EdgeInsets.only(top: 20)),
		small: TDim(width: 457),
		medium: TDim(width: 351),
		large: TDim(width:  487),
	);

	static TDims socialIconGroup = TDims(
		defaults: TDim(width: 241),
	);

	static TDims socialIcon = TDims(
		defaults: TDim(width: 100),
	);

	///
	///		R - C O L
	///
	static TDims rcol = TDims(
		defaults: TDim(width: 0, height: 0),
		large: TDim(
				width: ScreenUtil.largeDesign.sketchWidth - (lcol.large!.width! + mcol.large!.width!)),
	);
	static TDims illustration = TDims(
		defaults: TDim(width: 679, height: 806),
	);
}
