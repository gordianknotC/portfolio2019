import 'dart:math';

import 'package:dart_common/dart_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/icons/my_flutter_app_icons.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';
import 'package:layout_widgets/src/widgets/stateful.dart';
import 'package:layout_widgets/src/widgets/custom_gesture.dart';
import 'package:layout_widgets/src/widgets/responsive_widget.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/models/models.dart';
import 'package:portfolio/route_supplement.dart';
import 'package:layout_widgets/src/widgets/portfolio_slideup_panel.dart';
import 'package:portfolio/ui/layout/dialogs.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';


final _D = Logger.filterableLogger(moduleName: 'PORT');

enum _ELan {
  nwjs,
  vuejs,
  flash,
  title
}

enum _ELink {
  file,
  link,
  platform
}

enum _EPortfolio {
  vue,
  nw,
  flash
}


class ImageOver extends MouseRegion {
  const ImageOver(Widget child)
      : super(child: child,

  );

}


class PortfolioImageTitle extends StatelessWidget {
  final double height;
  final double? width;
  final double titleSize = 13;
  final double decorSize = 8;
  final String textA;
  final String textB;
  final Color bgColor;
  final Color textColor;
  final Alignment? alignment;
  final IconData? icon;

  const PortfolioImageTitle({
    this.icon,
    this.height = 32,
    this.alignment,
    this.width,
    this.textA = "",
    this.textB = "",
    this.bgColor = Colors.white,
    this.textColor = MColors.textDark});

  MainAxisAlignment convertAlign() {
    if (alignment == Alignment.centerLeft) {
      return MainAxisAlignment.start;
    } else if (alignment == Alignment.centerRight) {
      return MainAxisAlignment.end;
    }
    return MainAxisAlignment.center;
  }

  @override Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width ?? 40,
        alignment: alignment ?? Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: bgColor,
        ),
        child: PortfolioCollapseLabel(
          colorA: textColor,
          colorB: textColor.withOpacity(0.6),
          textA: textA,
          textB: textB,
          showDecor: false,
          icon: icon,
          alignemnt: convertAlign(),
        )
    );
  }
}


class PortfolioCollapseArea extends StatelessWidget {
  final double width;
  final double height;
  final double titleSize = 13;
  final double decorSize = 8;
  final double marginTop;

  const PortfolioCollapseArea(
      {required this.width, this.height = 33, this.marginTop = 20});

  @override Widget build(BuildContext context) {
    final marginLR = (ScreenUtil.screenWidthDp - width) / 2;

    /// note: collowing container cannot replaced with [PhysicalModel]
    _D.i(() => ('build collapse w: ${width}, LR: ${marginLR}, screen:${ScreenUtil.screenWidthDp}'));
        return Container(
        height: height,
        margin: EdgeInsets.fromLTRB(marginLR, marginTop, marginLR, 0.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: Colors.grey.withOpacity(0.6),
              )
            ]
        ),
        child: PortfolioCollapseLabel(showDecor: false,)
    );
  }
}


/// main label(collapse label) for [SlidingUpPanel]
///
class PortfolioCollapseLabel extends StatelessWidget {
  final double titleSize = 13;
  final double decorSize = 8;
  final String textA;
  final String textB;
  final Color colorA;
  final Color colorB;
  final bool showDecor;
  final IconData? icon;
  final MainAxisAlignment? alignemnt;

  const PortfolioCollapseLabel({
    this.icon,
    this.textA = "2010~2019",
    this.textB = "Portfolio",
    this.colorA = MColors.textDark,
    this.colorB = MColors.textAccent,
    this.showDecor = true,
    this.alignemnt,
  });

  @override Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (textA != null || textB != null)
            Row(
              mainAxisAlignment: alignemnt ?? MainAxisAlignment.center,
              children: <Widget>[
                if (icon != null)
                  Icon(icon, color: colorA, size: titleSize),
                if (icon != null)
                  SizedBox(width: 5),
                Literal.spans([
                  Literal.spanH5E(textA, colorA, fontSize: titleSize),
                  Literal.spanH5E(textB, colorB, fontSize: titleSize),
                ]),
              ],
            ),

          if (showDecor)
            Literal.spans([
              Literal.spanP2("product design & web deisgn",
                  color: MColors.textDark,
                  fontFamily: Fonts.Khand,
                  fontSize: decorSize),
            ])
        ]);
  }
}


/// CloudTag for showing programming language
class PortfolioLabel extends StatelessWidget {
  final _ELan type;

  const PortfolioLabel.nwjs() : type = _ELan.nwjs;

  const PortfolioLabel.vuejs() : type = _ELan.vuejs;

  const PortfolioLabel.flash() : type = _ELan.flash;

  const PortfolioLabel.title() : type = _ELan.title;


  @override Widget build(BuildContext context) {
    switch (type) {
      case _ELan.nwjs:
        return CloudModel.nwjs;
        break;
      case _ELan.vuejs:
        return CloudModel.vuejs;
      case _ELan.flash:
        return CloudModel.flash;
      case _ELan.title:
        return Container(
            height: 36,
            width: 140,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(18))
            ),
            child: PortfolioCollapseLabel(showDecor: true,)
        );
    }
    throw Exception('uncaught case');
  }
}


class Circle extends StatelessWidget {
  final double radius;
  final Color color;
  final Widget? child;
  final double? width;

  double get height => radius * 2;

  const Circle(this.radius,
      {this.color = Colors.white, this.child, this.width});

  @override Widget build(BuildContext context) {
    return Container(
        height: radius * 2,
        width: width ?? (radius * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: Colors.white,
        ),
        child: Center(child: child ?? Container())
    );
  }
}


/// untested:
/*class BubbleUpCircles extends StatefulWidget {
	final List<Circle> circles;
	final bool opened;
	final double gap;
	final void Function(bool, int) onOpen;
	const BubbleUpCircles(this.circles, {this.opened = false, this.onOpen, this.gap = 10});

	@override State<StatefulWidget> createState() {
		return BubbleUpCirclesState();
	}
}

class BubbleUpCirclesState extends State<BubbleUpCircles> {
	bool opened;
	@override
  void initState() {
    super.initState();
		opened ??= widget.opened;
	}

	void toggle(int i){
		final index = (widget.circles.length - 1) - i;
		if (index == 0){
			opened = !opened;
			_D.i(()=>('Bubble $opened');
		}
		widget.onOpen?.call(opened, index);
		setState((){});
	}

	@override Widget build(BuildContext context) {
			final children = widget.circles.reversed.fold<List<Circle>>([], (initial, b){
				return initial + [b];
			});

			double a = 0, b = 0;
			return Container(
				width : children.first.width,
				height: children.length * children.first.height + (children.length -1) * widget.gap,
				child : Stack(children: List<Widget>.generate(children.length, (i){
					final child = children[i];
					if (!opened){
						if (i == children.length -1){
							return Positioned(bottom: 0, child: MaterialButton(
								child: child,
								onPressed: () => toggle(i)
							));
						}
						return Positioned(bottom: 0, child: child);
					}

					a += b;
					b = ((children.length - 1) - i) * (child.height + widget.gap);
					return Animator<double>(
							tween: Tween<double>(begin: a, end: b),
							builder: (anim) => Positioned(
									child: MaterialButton(
										child: child,
										onPressed: () => toggle(i),
									),
									bottom: b
							)
					);
				}))
			);
	}
}*/


/// cloudTag for showing link type
class PortfolioLinkLabel extends StatelessWidget {
  static Circle baseCircle(IconData icon, String text,
      [Color color = MColors.textDark, double? width]) {
    return Circle(20,
        width: width ?? 92,
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: Paddings.zero,
                  child: Icon(icon, color: color, size: 16)),
              Literal.p(text, color: color)
            ]
        )
    );
  }

  // ------------------------------
  static final link_circle = baseCircle(
      CustomIcons.link_1, 'web', MColors.textAccent);
  static final file_circle = baseCircle(
      CustomIcons.file_download, 'file', MColors.textAccent);
  static final more_circle = baseCircle(
      CustomIcons.file_download, 'file', MColors.textAccent);
  static final win_circle = baseCircle(
      CustomIcons.windows, 'file', MColors.textAccent);
  static final mac_circle = baseCircle(
      CustomIcons.apple, 'file', MColors.textAccent);

  // ------------------------------
  final _ELink type;
  final List<String> links;

  const PortfolioLinkLabel.link (this.links) : type = _ELink.link;

  const PortfolioLinkLabel.file (this.links) : type = _ELink.file;

  const PortfolioLinkLabel.platform(this.links) : type = _ELink.platform;

  // ------------------------------

  @override Widget build(BuildContext context) {
    switch (type) {
      case _ELink.file:
        return Circle(13, child: file_circle, width: 60);
      case _ELink.link:
        return Circle(13, child: link_circle, width: 60);
      case _ELink.platform:
        return Circle(13, child: file_circle, width: 60);
    }
    throw Exception("Uncaught Enum $type");
  }
}

/// showing portfolio preview image
class PortfolioPreviewImage extends StatefulWidget {
  static Color tColor = IS_MOBILE ? Colors.white : MColors.textDark;
  static String subText = IS_MOBILE ? " portfolio" : "";
  static double titleWidth = IS_MOBILE ? 120 : 70;
  static Color titleBg = IS_MOBILE ? MColors.textDark : Colors.white;

  final Image image;
  final _EPortfolio type;
  final PortfolioLinkLabel link;
  final PortfolioLabel lang;
  final PortfolioImageTitle year;
  final PortfolioImageTitle title;

  PortfolioPreviewImage.vue()
      : type = _EPortfolio.vue,
        image = Image.asset(Assets.portfolio_vue),
        link = PortfolioLinkLabel.link([LINKS.portfolio_vue]),
        lang = PortfolioLabel.vuejs(),
        year = PortfolioImageTitle(
            textA: "2019",
            textB: subText,
            textColor: tColor,
            bgColor: titleBg,
            width: titleWidth,
            alignment: Alignment.center),
        title = PortfolioImageTitle(
            height: 53,
            alignment: Alignment.centerRight,
            icon: CustomIcons.link_1,
            textA: "web link     ",
            textB: "",
            bgColor: MColors.textAccent,
            textColor: Colors.white);

  PortfolioPreviewImage.nw()
      : type = _EPortfolio.nw,
        image = Image.asset(Assets.portfolio_nwjs),
        link = PortfolioLinkLabel.file(
            [LINKS.portfolio_nw_win, LINKS.portfolio_nw_mac]),
        lang = PortfolioLabel.nwjs(),
        year = PortfolioImageTitle(
            textA: "2014",
            textB: subText,
            textColor: tColor,
            bgColor: titleBg,
            width: titleWidth,
            alignment: Alignment.center),
        title = PortfolioImageTitle(
            height: 53,
            alignment: Alignment.centerRight,
            icon: CustomIcons.file_download,
            textA: "file link     ",
            textB: "",
            bgColor: MColors.textAccent,
            textColor: Colors.white);

  PortfolioPreviewImage.flash()
      : type = _EPortfolio.flash,
        image = Image.asset(Assets.portfolio_flash),
        link = PortfolioLinkLabel.link([LINKS.portfolio_flash]),
        lang = PortfolioLabel.flash(),
        year = PortfolioImageTitle(
            textA: "2007",
            textB: subText,
            textColor: tColor,
            bgColor: titleBg,
            width: titleWidth,
            alignment: Alignment.center),
        title = PortfolioImageTitle(
            height: 53,
            alignment: Alignment.centerRight,
            icon: CustomIcons.link_1,
            textA: "web link     ",
            textB: "",
            bgColor: MColors.textAccent,
            textColor: Colors.white);

  @override
  _PortfolioPreviewImageState createState() => _PortfolioPreviewImageState();
}

class _PortfolioPreviewImageState extends State<PortfolioPreviewImage> {
  bool hover = false;

  Widget platformBt(IconData icon, String text) {
    return MaterialButton(
        onPressed: () {
          if (icon == CustomIcons.windows) {
            launch('http://yesdesign.dynu.net:12345/fileServing/win32.rar');
          } else {
            launch('http://yesdesign.dynu.net:12345/fileServing/osx32.rar');
          }
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: MColors.textAccent, size: 24),
              SizedBox(width: 10),
              Literal.spans([
                Literal.spanP(text, color: MColors.textAccent)
              ])
            ])
    );
  }

  void onShowFlassDialog() {
    showDialog<void>(
        context: context,
        builder: Dialogs.noteSquareBuilder([
          Literal.spans([
            Literal.spanH4E("說明", MColors.textDark,),
            Literal.spanP("由於Flash在許多browser上己經不支持, 可能會該連結點擊了以後可能沒有反應"),
          ]),
          SizedBox(height: 20),
          MaterialButton(
              elevation: 3,
              onPressed: () {
                launch('http://yesdesign.dynu.net:12345/flashweb/index.html');
              },
              child: PortfolioLinkLabel.baseCircle(
                  CustomIcons.link_1, '前往連結', MColors.textAccent)
          )
        ], maxSide: 350)
    );
  }

  void onShowNWDialog() {
    showDialog<void>(
        context: context,
        builder: Dialogs.noteRectBuilder([
          Literal.spans([
            Literal.spanH4E("說明", MColors.textDark,),
            Literal.spanP("應用由NWjs寫成,檔案為壓縮檔, 解壓後, 內有一exe執行檔"),
          ]),
          SizedBox(height: 20),
          Wrap(
              runSpacing: 10,
              spacing: 3,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                platformBt(CustomIcons.windows, "for win"),
                platformBt(CustomIcons.apple, "for ios"),
              ])
        ], maxSide: 350)
    );
  }


  Widget hoverableImage(BoxConstraints c) {
    final ratio = c.maxWidth / 20;
    return GestureDetector(
      onTap: () {
        _D.d(() => 'tap link ${widget.link.links}');
        if (widget.link.links.last == LINKS.portfolio_vue) {
          launch(widget.link.links.last);
        } else if (widget.link.links.last == LINKS.portfolio_flash) {
          onShowFlassDialog();
        } else if (widget.link.links.contains(LINKS.portfolio_nw_win)) {
          onShowNWDialog();
        }
      },
      child: MouseRegion(
        onEnter: (e) {
          hover = true;
          _D.d(() => 'hover');
          setState(() {});
        },
        onExit: (e) {
          hover = false;
          _D.d(() => 'hout');
          setState(() {});
        },
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(c.maxWidth / ratio)),
            child: widget.image
        ),
      ),
    );
  }

  Widget buildLargeOrMedium(BuildContext context) {
    final double margin = IS_MOBILE ? 10 : 20;
    final half = margin / 2;
    return LayoutBuilder(
        builder: (ctx, c) {
          return Stack(
            children: <Widget>[
              hoverableImage(c),
              if (hover)
                Positioned(
                    left: half, top: half, right: half, child: widget.title),
              Positioned(left: margin, top: margin, child: widget.year),
              if (IS_MOBILE)
                Positioned(left: margin, bottom: half, child: widget.link),
              Positioned(right: margin, bottom: half, child: widget.lang),
            ],
          );
        }
    );
  }

  Widget buildSmall(BuildContext context) {
    final double margin = IS_MOBILE ? 10 : 20;
    final half = margin / 2;
    return LayoutBuilder(
        builder: (ctx, c) {
          return Stack(
            children: <Widget>[
              hoverableImage(c),
              if (hover)
                Positioned(
                    left: half, top: half, right: half, child: widget.title),
              Positioned(left: margin, top: margin, child: widget.year),
              if (IS_MOBILE)
                Positioned(left: margin, bottom: margin, child: widget.link),
              Positioned(right: margin, bottom: margin, child: widget.lang),
            ],
          );
        }
    );
  }

  @override Widget build(BuildContext context) {
    return ResponsiveElt(
        responsiveSize: SIZE_CELLPHONE,
        media: TRWMedia.fromConstaints(ScreenUtil.screenConstraintMax),
        large: buildLargeOrMedium(context),
        small: buildSmall(context)
    );
  }
}


class PortfolioPanel extends StatefulWidget {
  final double width;
  final double height;
  final double marginTop;
  final ScrollerNestedPanelGestureController gestureController;

  const PortfolioPanel({
    required this.width, required this.height,
    required this.marginTop, required this.gestureController
  });

  @override
  _PortfolioPanelState createState() => _PortfolioPanelState();
}

class _PortfolioPanelState extends State<PortfolioPanel> {
  ScrollerNestedPanelGestureController? controller;

  Widget baseBuilder(BuildContext context, Widget child) {
    return LayoutBuilder(
        builder: (context, constraint) =>
            PanelGestureDetector(
              gestureController: widget.gestureController,
              child: SingleChildScrollView(
                controller: widget.gestureController.pageController,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: widget.marginTop),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Colors.grey,
                            ),
                          ]
                      ),
                      child: child,
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget sized(Widget image) {
    return ConstrainedBox(
        child: image,
        constraints: BoxConstraints(maxWidth: 507 / 2)
    );
  }

  Widget buildLarge(BuildContext context) {
    _D.d(() => 'rebuld panel responsive');
//		final h = max(10.0, ScreenUtil.screenWidthDp / 36);
    const GAP = const SizedBox(height: 20, width: 20);
    return baseBuilder(context, Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PortfolioLabel.title(),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(fit: FlexFit.loose,
                    child: sized(PortfolioPreviewImage.vue())), GAP,
                Flexible(fit: FlexFit.loose,
                    child: sized(PortfolioPreviewImage.nw())), GAP,
                Flexible(fit: FlexFit.loose, child: sized(Column(children: [
                  Wrap(
                    alignment: WrapAlignment.end,
                    runSpacing: 10,
                    spacing: 10,
                    children: <Widget>[
                      PortfolioLabel.flash(),
                      PortfolioLabel.vuejs(),
                      PortfolioLabel.nwjs(),
                    ],
                  ),
                  GAP,
                  GAP,
                  PortfolioPreviewImage.flash(),
                  GAP,
                ])))
              ]),
          SizedBox(height: 30)
        ],
      ),
    ));
  }

  Widget bulidMedium(BuildContext context) {
    _D.d(() => 'rebuld panel responsive');
//		final h = max(10.0, ScreenUtil.screenWidthDp / 36);
    const GAP = const SizedBox(height: 20, width: 20);
    return baseBuilder(context, Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PortfolioLabel.title(),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(fit: FlexFit.loose,
                    child: sized(PortfolioPreviewImage.vue())), GAP,
                Flexible(fit: FlexFit.loose,
                  child: sized(Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.end,
                          runSpacing: 10,
                          spacing: 10,
                          children: <Widget>[
                            PortfolioLabel.flash(),
                            PortfolioLabel.vuejs(),
                            PortfolioLabel.nwjs(),
                          ],
                        ), GAP, GAP,
                        PortfolioPreviewImage.flash(),
                        GAP,
                        PortfolioPreviewImage.nw(),
                        GAP, GAP,
                      ]),
                  ),
                ),
              ]),
          SizedBox(height: 30)
        ],
      ),
    ));
  }

  Widget buildSmall(BuildContext context) {
    const GAP = const SizedBox(height: 10, width: 10);
    _D.d(() => 'rebuld panel responsive');
    return baseBuilder(context, Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PortfolioLabel.title(),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: PortfolioPreviewImage.vue()),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.end,
                          runSpacing: 10,
                          spacing: 10,
                          children: <Widget>[
                            PortfolioLabel.flash(),
                            PortfolioLabel.vuejs(),
                            PortfolioLabel.nwjs(),
                          ],
                        ),
                        SizedBox(height: 30),
                        PortfolioPreviewImage.flash(), GAP,
                        PortfolioPreviewImage.nw(),
                        SizedBox(height: 30)
                      ]),
                )
              ]),
          SizedBox(height: 30)
        ],
      ),
    ));
  }

  @override Widget build(BuildContext context) {
    _D.d(() => 'rebuild PortfolioPanel');
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: ResponsiveElt(
          responsiveSize: SIZE_CELLPHONE,
          media: TRWMedia(mediaWidth: ScreenUtil.screenWidthDp),
          large: buildLarge(context),
          medium: bulidMedium(context),
          small: buildSmall(context)
      ),
    );
  }


}


class PortfolioPage extends StatefulWidget {
  final Widget body;

  const PortfolioPage(this.body);

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with RouteAwarePlus, RouteObserverMixin<PortfolioPage> {
  late ScrollerNestedPanelGestureController gestureController;
  ScrollerNestableSlidingUpPanel? panel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gestureController = ScrollerNestedPanelGestureController(
      pageController: PageController(),
      panelController: PanelController(),
    );
  }

  void open() {
    _D.i(() => ('- panel open'));
    Future.delayed(Duration(milliseconds: 500), () {
      gestureController.panelController.open();
    });
  }

  void close() {
    _D.i(() => ('- panel close'));
    SchedulerBinding.instance.addTimingsCallback((_) {
      gestureController.panelController.close();
    });
  }

  Widget slidingUp(Widget body) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    final double cheight = 35;
    final double marginTop = 20;
    final double panelHeight = ScreenUtil.screenHeightDp - 20;
    final double collapseW = max(ScreenUtil.screenWidthDp / 3, 210);
    panel = ScrollerNestableSlidingUpPanel(
      renderPanelSheet: false,
      minHeight: cheight + marginTop,
      maxHeight: panelHeight,
      backdropEnabled: true,
      backdropTapClosesPanel: true,
      gestureController: gestureController,
      panel: PortfolioPanel(
          width: ScreenUtil.screenWidthDp,
          height: panelHeight,
          marginTop: marginTop + cheight,
          gestureController: gestureController
      ),
      collapsed: PortfolioCollapseArea(
          width: collapseW, height: cheight, marginTop: marginTop),
      body: body,
      borderRadius: radius,
      parallaxEnabled: true,
    );
    assert(panel?.controller != null);
    return ConstrainedBox(
      constraints: BoxConstraints(
//				maxHeight: ScreenUtil.screenConstraintMax.maxHeight,
//				maxWidth: ScreenUtil.screenConstraintMax.maxWidth,
        minHeight: ScreenUtil.screenConstraintMax.minHeight,
        minWidth: ScreenUtil.screenConstraintMax.minWidth,
      ),
      child: panel,
    );
  }

  @override
  Widget build(BuildContext context) {
    _D.d(() => 'rebuild portfolio');
    if (!visible)
      return Container();
    return slidingUp(widget.body);
  }

  /// Called when the current route has been pushed.
  @override
  void didPush() {
    if (App.routeHistory?.last?.settings.name == ROUTE.PORTFOLIO) {
      _D.c(() => 'push portfolio page');
      open();
    }
  }

  /// Called when the current route has been popped off.
  @override
  void didPop() {
    if (App.routeHistory?.last?.settings.name == ROUTE.PORTFOLIO) {
      _D.c(() => 'popup portfolio page');
      close();
      App.routeHistory?.removeLast();
    }
  }
}
