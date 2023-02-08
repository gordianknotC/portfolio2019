
import 'package:dart_common/dart_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/icons/my_flutter_app_icons.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';
import 'package:layout_widgets/src/widgets/debugs.dart';
import 'package:layout_widgets/src/widgets/responsive_widget.dart';
import 'package:portfolio/ui/pages/contact/contact.dart';
import 'package:portfolio/ui/pages/contact/contact_dims.dart';
import 'package:portfolio/ui/pages/home/home_footer.dart';


final _D = Logger.filterableLogger(moduleName:'CONTACTM');


class ContactPageMCol extends StatelessWidget {
	static final iconsize = 21.0;
	static final refLength = 10;

	static final Widget gmailicon = Paddings.contactUnit(
		child: MaterialButton(
			onPressed: HomeFooter.onEmail,
			padding: EdgeInsets.all(0),
			child: ContactTile(icon: Icons.mail_outline, size: iconsize,
				decortext: 'gordianknot1981@gmail.com', decorRefLength: refLength,
				title:"Gmail", decorSpacing: 0,),
		),
	);

	static final Widget bloggericon = Paddings.contactUnit(
		child: MaterialButton(
			onPressed: HomeFooter.onBlogger,
			padding: EdgeInsets.all(0),
			child: ContactTile(icon: CustomIcons.blogger, size: iconsize, iconsize: iconsize* 20/24,
				decortext: 'archetypesnalmaas.blogspot.com',decorRefLength: refLength,
				title:"blogger", decorSpacing: 0,),
		),
	);

	static final Widget twittericon = Paddings.contactUnit(
		child: MaterialButton(
			onPressed: HomeFooter.onTwitter,
			padding: EdgeInsets.all(0),
			child: ContactTile(icon: CustomIcons.twitter, size: iconsize,
				decortext: 'twitter.com/GDknot',decorRefLength: refLength,
				title:"Twitter", decorSpacing: 0,),
		),
	);

	static  Widget lineicon (BuildContext context) => Paddings.contactUnit(
		child: MaterialButton(
			onPressed: () => HomeFooter.onLine(context),
			padding: EdgeInsets.all(0),
			child: ContactTile(icon: CustomIcons.line_icon, size: iconsize,
				decortext: 'gordianknot1981@gmail.com',decorRefLength: refLength,
				title:"Line", decorSpacing: 0,),
		),
	);

	final DesignCanvas design;

	const ContactPageMCol.small() : design = DesignCanvas.small;
	const ContactPageMCol.medium(): design = DesignCanvas.medium;
	const ContactPageMCol.large() : design = DesignCanvas.large;

	Widget buildSocialIconGroup(BuildContext context){
		return BoundingBox(
		  child: Container(
		  	constraints: BoxConstraints.tightFor(width: ContactDim.socialIconGroup.width),
		  	padding: ContactDim.mcol.padding,
		  	child: Column(
					crossAxisAlignment: CrossAxisAlignment.center,
					mainAxisSize: MainAxisSize.min,
					mainAxisAlignment: MainAxisAlignment.start, children:[
						Row(children: <Widget>[
							Expanded(child: gmailicon),
							Expanded(child: bloggericon),
						]),
						Row(children: <Widget>[
							Expanded(child: twittericon),
							Expanded(child: lineicon(context)),
						]),
		  	]),
		  ),
		);
	}

	Widget buildSmallCanvas(BuildContext context){
		_D.d(()=>'social padding: ${ContactDim.socialIconGroup.padding}');
		return BoundingBox(
		  child: BoundingBox(child: buildSocialIconGroup(context)),
		);
	}

	Widget buildMediumCanvas(BuildContext context){
		_D.d(()=>'social padding: ${ContactDim.socialIconGroup.padding}');
		return BoundingBox(
		  child: BoundingBox(child: buildSocialIconGroup(context)),
		);
	}
	Widget buildLargeCanvas(BuildContext context){
		_D.d(()=>'social padding: ${ContactDim.socialIconGroup.padding}');
		return Center(
				child: buildSocialIconGroup(context));
	}

	@override Widget build(BuildContext context) {
		return ResponsiveElt(
			media: TRWMedia.fromConstaints(ScreenUtil.screenConstraintMax),
			responsiveSize: SIZE_DESIGNCANVAS,
			large: buildLargeCanvas(context),
			medium: buildMediumCanvas(context),
			small: buildSmallCanvas(context),
		);
	}
}


