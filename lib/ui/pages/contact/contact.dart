import 'package:dart_common/dart_common.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';
import 'package:layout_widgets/src/widgets/debugs.dart';
import 'package:layout_widgets/src/widgets/responsive_widget.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:layout_widgets/src/widgets/stateful.dart';
import 'package:portfolio/models/models.dart';
import 'package:portfolio/ui/pages/contact/contact_dims.dart';
import 'package:portfolio/ui/pages/contact/contact_lcol.dart';
import 'package:portfolio/ui/pages/contact/contact_mcol.dart';
import 'package:portfolio/ui/layout/menu/menu.dart';
import 'package:portfolio/ui/pages/home/home_footer.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';

import '../../../route_supplement.dart';

final _D = Logger.filterableLogger(moduleName: 'CONTACT');

class ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String decortext;
  final int decorRefLength;
  final double size;
  final double? iconsize;
  final double decorSpacing;

  const ContactTile({
    required this.icon,
    required this.title,
    required this.decortext,
    this.iconsize,
    required this.size,
    required this.decorRefLength,
    this.decorSpacing = 1.0
  });

  @override
  Widget build(BuildContext context) {
    final _icon = Icon(icon, size: iconsize ?? size, color: MColors.textAccent);
    final double titleHeight = IS_MOBILE ? 1 : 1;
    final _title = Text(title,
        style: TextStyles.h4.copyWith(
            color: MColors.textDark.withOpacity(0.7),
            height: titleHeight,
            fontSize: size * 21 / 26.floorToDouble() * 0.75,
            fontFamily: Fonts.product));
    return Padding(
      padding: EdgeInsets.all(0),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Paddings.skillIcon(child: _icon),
            _title,
          ]),
    );
  }
}

class ContactPage extends StatefulWidget {
  static final double paddingLR = 130;
  static const MediaDim contactBody = MediaDim(60, 40, 40);

  const ContactPage();

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with RouteAwarePlus, RouteObserverMixin<ContactPage> {
  Widget _buildLargeScreen(BuildContext context, BoxConstraints constraints) {
    _D.d(() => 'rebuild largeScreen contact');
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: ContactDim.lcol.width.toInt(),
                  child: ContactPageLCol.medium()),
              // note: don't put const here
              Expanded(
                  flex: ContactDim.mcol.width.toInt(),
                  child: const ContactPageMCol.medium()),
              Expanded(
                  flex: ContactDim.rcol.width.toInt(),
                  child: ContactPageRCol()),
              // note: don't put const here
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: const HomeFooter.largenoIcon())
        ],
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context, BoxConstraints constraints) {
    _D.d(() => 'rebuild smallScreen contact');
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: ContactDim.lcol.width.toInt(),
                  child: ContactPageLCol.medium()),
              // note: don't put const here
              Expanded(
                  flex: ContactDim.mcol.width.toInt(),
                  child: const ContactPageMCol.medium()),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: const HomeFooter.largenoIcon())
        ],
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context, BoxConstraints constraints) {
    _D.d(() => 'rebuild smallScreen contact');
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
              alignment: Alignment.bottomCenter,
              child: ContactPageLCol.small()), // note: don't put const here
          const ContactPageMCol.small(),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: const HomeFooter.smallnoIcon()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!visible) return Container();

    _D.d(() => 'rebuild contact');
    return LayoutBuilder(builder: (context, constraints) {
      _D.d(() => 'rebuild contact layout builder, ${constraints.maxWidth}');
      TRWMedia.fromConstaints(ScreenUtil.screenConstraintMax);
      return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: constraints.maxWidth,
          minHeight: ScreenUtil.screenHeightDp - HomeAppBar.sliverBarHeight,
        ),
        child: ResponsiveElt(
          key: const ValueKey("ContactLayoutResponsive"),
          media: TRWMedia.fromConstaints(ScreenUtil.screenConstraintMax),
          responsiveSize: SIZE_DESIGNCANVAS,
          large: DebugBox(child: _buildLargeScreen(context, constraints)),
          medium: DebugBox(child: _buildMediumScreen(context, constraints)),
          small: DebugBox(child: _buildSmallScreen(context, constraints)),
        ),
      );
    });
  }

  @override
  void didPop() {
    // TODO: implement didPop
  }

  @override
  void didPush() {
    // TODO: implement didPush
  }
}
