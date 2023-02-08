import 'package:dart_common/dart_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';
import 'package:layout_widgets/src/widgets/debugs.dart';
import 'package:portfolio/ui/pages/contact/contact_dims.dart';

final _D = Logger.filterableLogger(moduleName:'CONTACT');


class ContactPageRCol extends StatelessWidget {
	static Image  illustration = Image.asset (
		Assets.illustration,
		width: ContactDim.illustration.width,
		height: ContactDim.illustration.height,
	);
	const ContactPageRCol();

	@override Widget build(BuildContext context) {
		return LayoutBuilder(builder:(ctx, constraints){
			final posx = constraints.maxWidth * 1/3;
			_D.d(()=>'illustration w:${illustration.width}, h:${illustration.height}');
			return Stack(children:[
				BoundingBox(child: Container(
						width: illustration.width, height: illustration.height)),

				Positioned(
					left:posx,
					child: BoundingBox(
						child: SizedBox(
							child: illustration,
							width: illustration.width,
							height: illustration.height,
							//child: illustration,
						),
					),
				)
			]);

		});
	}
}


class ContactPageLCol extends StatelessWidget {
	static AssetImage  get avatar => AssetImage (Assets.avatar);
	static Widget get circle => Padding(
			padding: ContactDim.avatar.padding, // 0
			child: Stack(
			  children: <Widget>[
					Icon(Icons.account_circle, size: ContactDim.avatar.height, color: MColors.textAccent.withOpacity(0.6)),
					CircleAvatar(
			    		foregroundColor: Colors.transparent,
			    		backgroundColor: Colors.transparent,
			    		radius:ContactDim.avatar.height/2,
			    		backgroundImage: avatar
			    ),
			  ],
			)
	);

	final DesignCanvas design;
	const ContactPageLCol.small(): design = DesignCanvas.small;
	const ContactPageLCol.medium(): design = DesignCanvas.medium;
	const ContactPageLCol.large(): design = DesignCanvas.large;

	Widget buildAvatarSection(BuildContext context){
		return Column(
			crossAxisAlignment: CrossAxisAlignment.center,
			mainAxisAlignment: MainAxisAlignment.start,
			mainAxisSize: MainAxisSize.min,
			children:[
				circle,
				Padding(
					padding: ContactDim.avatarTitle.padding,
					child: Literal.spans([
						Literal.spanH3E("Curtis", MColors.textAccent),
						Literal.spanH3E("Chang", MColors.textDark),
					]),
				),

				Row(
					mainAxisAlignment: MainAxisAlignment.start,
					mainAxisSize: MainAxisSize.min,
					children:[
						Icon(Icons.phone, color: MColors.textAccent,size: 14),
						Text("0910928253", style: TextStyles.h5.copyWith(color: MColors.textDark.withOpacity(0.7)))
					]),

				Padding(
						padding: ContactDim.avatarMoto.padding,
						child: Container(
							width: ContactDim.avatarMoto.width,
							child: Literal.spans([
								Literal.spanH5E("moto\n", MColors.textAccent),
								Literal.spanP2(
									"Freedom is Eternal Vigilance. Too much grasping always "
									"brings negative side effect, and it is this side effect "
									"eventually brings true freedom to our inner most self. It is an "
									"unfolding path, to reveal our true self, to drive us to "
									"live by what we really have, and knows what we really want..",
									color: MColors.textDark.withOpacity(0.7)
								),
							]),
						)
				)
			]);
	}

	@override Widget build(BuildContext context) {
		_D.d(()=>'place spaceman at right: ${ScreenUtil.screenWidthDp/2}');
		return LayoutBuilder(
			builder: (ctx, constraints) => BoundingBox(
				child: Stack(
					children: <Widget>[
						Positioned(
							top: 0, bottom: 0,	right: constraints.maxWidth/2,
							child: BoundingBox(
								child: Image.asset(Assets.spaceman,
										width: ContactDim.spaceman.width,
										height: ContactDim.spaceman.height),
							),
						),
						Row(
								mainAxisAlignment: MainAxisAlignment.center,
								mainAxisSize: MainAxisSize.max,
								children:[
									BoundingBox(child: buildAvatarSection(ctx))
								]),
					],
				),
			),
		);
	}
}
