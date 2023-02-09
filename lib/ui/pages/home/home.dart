//import 'dart:html' as html;
import 'package:dart_common/dart_common.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';
import 'package:layout_widgets/src/widgets/debugs.dart';
import 'package:layout_widgets/src/widgets/responsive_widget.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:layout_widgets/src/widgets/stateful.dart';
import 'package:portfolio/models/models.dart';
import 'package:portfolio/route_supplement.dart';
import 'package:portfolio/ui/layout/Gallery.dart';
import 'package:portfolio/ui/layout/skillUnit.dart';
import 'package:portfolio/ui/pages/home/home_footer.dart';

import 'package:route_observer_mixin/route_observer_mixin.dart';


final _D = Logger.filterableLogger(moduleName:'HOME');

class HomeTitle extends StatelessWidget {
  final String? chinese;
  final String? english;
  final String? english2;
  const HomeTitle(this.chinese, this.english, this.english2);

  @override
  Widget build(BuildContext context) {
    return RichText(
      strutStyle: StrutStyle(
        fontSize: 41,
        height: 1,
      ),
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will in_buildAboutMeherit styles from parent
        style: TextStyle(
          fontSize: 41.0,
          color: Colors.black,
          textBaseline: TextBaseline.ideographic,
          height: 1,
        ),
        children: <TextSpan>[
          TextSpan(
            text: english ?? STRINGS.about,
            style: TextStyles.h2.copyWith(
              color: MColors.textDark,
              fontSize: ResponsiveScreen.isSmallScreen(context) ? 36 : 41.0,
            ),
          ),
          TextSpan(
            text: english2 ?? STRINGS.me,
            style: TextStyles.h2.copyWith(
              color: MColors.textAccent,
              fontSize: ResponsiveScreen.isSmallScreen(context) ? 36 : 41.0,
            ),
          ),
          TextSpan(
            text: chinese ?? STRINGS.cAbout_me,
            style: TextStyles.h2C,
          ),
        ],
      ),
    );
  }
}

class _HomeHeadline extends StatelessWidget {
  const _HomeHeadline();
  @override
  Widget build(BuildContext context) {
    return Paddings.headline(
      context: context,
      child: Text(
        STRINGS.CheadlineMyself,
        style: TextStyles.h5CIt.copyWith(
          height: IS_MOBILE ? 0.8 : 1, letterSpacing:  IS_MOBILE ? 1: 1.2
        ),
      ),
    );
  }
}

class _HomeSummary extends StatelessWidget {
  const _HomeSummary();
  Widget _buildMotto(){
    return Column(
      children: <Widget>[
        RichText(
            text: TextSpan(children:[
              Literal.spanBoldP("禪說: "),
              Literal.spanItP("將心待悟, 求昇反墮, 過份執著常帶來反效果，但也正是因為這個反效果能"
                  "該人知所進退有所取捨，也正因為有所取捨才能帶來心靈的自由.\n"),
            ])
        ),

				Padding(
				  padding: const EdgeInsets.only(left: 10.0),
				  child: Column(
						crossAxisAlignment: CrossAxisAlignment.center,
				    children: <Widget>[
				      RichText(
								text: TextSpan(children:[
									Literal.spanBoldP("\nThe Price of Freedom is Eternal Vigilance - Rolo May\n"),
								])
							),
							Text.rich(Literal.spanP("不僅在設計上如此, 程式也是如此..."))
						],
				  ),
				),
      ],
    );
  }

  /// [工業設計師],[機構設計師]及[網頁設計師], 也曾寫過[遊戲配樂]及[電子音樂], 總結自己的職業生涯, 主要
  ///  專注於視覺呈現及人性的觀察,  開發過的產品包括 [電競滑鼠], [鍵盤], presenter, 工業電腦,及
  ///  耳機, 常年的不足感, 雖然畫得一手好 sketch 但設計工作不好找, 近幾年花費不少時間研究前端設計及UI設計,
  ///            p("寫過"), h("遊戲配樂"), p("及"), h("電子音樂"),
  ///  android 開發過NFC應用App, 程式設計對我而言一種prototyping的能力, 如同工業設計師需要學會制作各種模型一樣,
  ///  直到開發了
  ///  android app才開始專注在真正的系統性設計, 雖然職業生涯雖然有點混亂, 但都離不開服務設計,
  ///   雖然做過機構設計及程式設計, 但以思維模式而言還是偏向於設計師關連性思維, 長時間研究哲學
  ///   心理學及玄密學(占星/人類圖), 喜歡觀察人, 有禪修沒念佛, 算是佛半個佛教徒,  MBTI 人格
  ///   量表屬 INFP 內向感性型, 摩羯座.
  Widget _buildSummary(){
    final a = Literal.spanLink;
    final b = Literal.spanBoldP;
    final h = Literal.spanAcc;
    final p = Literal.spanP;

    return RichText(
        text: TextSpan(children:[
          ...Literal.spanAccList("工業設計師、機構設計師"), p("及"), h("網頁設計師"),p("寫過"),
          ...Literal.spanLinkList("遊戲配樂、電子音樂", links:["", ""]),
          p("設計開模生產的產品有："),
          ...Literal.spanAccList("電競滑鼠x3， office滑鼠x2 隨身碟x1, 工業電腦．"),
          p("工業電腦涉及上百個零件，主要負責舊產品線客制化修改，及較小型之產品 - 血糖量測盒機構，"),
          p("熟悉"), b("NCT鋁件，"), b("待過沖壓廠"),p("對於鈑金件及部份鋁制加工很熟悉，其餘作品均為概念設計。"),
          p("常年的不足感, 雖然畫得一手好"), h("sketch"), p("但設計工作不好找。 近幾年開始轉而研究"),
          ...Literal.spanAccList("前端設計、UI設計、"),
          b('android開發'), p("開發過"), a("NFC"), b("工業4.0應用App"),
          p("程式設計對我而言是一種"), b("prototyping"), p("的能力，如同工業設計師需要學會制作各種"),
          b("原型"), p("一樣，雖同時做過工業設計及程式設計，但以"), b("思維模式"), p("思維模式而言仍是偏向於設計師的"),
          b("(關連性思維)."), p("只有在寫程式時會進入區隔性思維"),
          p("研究哲學心理學及玄密學(占星/人類圖), 喜歡觀察人, 有禪修沒念佛, 算是佛半個佛教徒, "),
          b("MBTI"),p("人格量表屬"), b("INFP"), p("，內向感性型，摩羯座，總結自己的職業生涯，主要專注於視覺呈現及人性的觀察。")
        ])
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
//        BoundingBox(child:
//          Paddings.summary(child: _HomeSummary(), context: context)),
        BoundingBox(child:
            Paddings.summary(child: _buildSummary(), context: context)),
        BoundingBox(child:
          Paddings.motto(child: _buildMotto()))
    ]);
  }
}


class HomeLCol extends StatelessWidget {
  static double designWidth = 752;
  static double get screenWidthLD => ScreenUtil.getInstance().setWidth(designWidth);

  final BoxConstraints constraints;
  final double deisgnWidth = 1;
  const HomeLCol(this.constraints):super(key: const ValueKey("HomeLCol"));

  Widget smallScreen(BuildContext context){
    _D.d(()=>'rebuild Lcol smallScreen');
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Paddings.skillSection(child: SkillSection.id(constraints)),
          Paddings.skillSection(child: SkillSection.programming(constraints)),
          Paddings.skillSection(child: SkillSection.ui(constraints)),
          Paddings.skillSection(child: SkillSection.music(constraints)),
          SizedBox(height: 15),
          Divider(height: 0.4, color:Colors.blueGrey),
        ],
      ),
    );
  }

  /// never executed on mobile, only on desktop
  Widget mediumScreen(BuildContext context){
    _D.d(()=>'rebuild Lcol mediumScreen');
    final w = constraints.maxWidth /2;
    final c = BoxConstraints(maxWidth: w, minWidth: w);
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Expanded(child: BoundingBox(child: SkillSection.id(c))),
                Expanded(child: BoundingBox(child: SkillSection.programming(c)))
              ]),
					SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Expanded(child: BoundingBox(child: SkillSection.ui(c))),
                Expanded(child: BoundingBox(child: SkillSection.music(c)))
              ])
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BoundingBox(child: HomeTitle(null, null, null)),
        BoundingBox(child: _HomeHeadline()),
        _HomeSummary(),
        ResponsiveScreen.isSmallScreen(context)
          ? Expanded(child: smallScreen(context))
          : mediumScreen(context),
      ],
    );
  }
}


class HomeRCol extends StatelessWidget {
  final BoxConstraints constraints;
  static const double colDesignWidth    = 590;
  static const double imageDesignWidth  = 490;
  static const double imageDesignHeight = 480;
  static final double imageDesignPaddingR = (colDesignWidth - imageDesignWidth);

  static List<Image> get images => Assets.gallery.map(
    (g) => Image.asset(g, width: ScreenUtil.getInstance().setWidth(imageDesignWidth))).toList();
  /// LD represents for Large Design
  static double get screenWidthLD => ScreenUtil.getInstance().setWidth(colDesignWidth);

  const HomeRCol(this.constraints);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.tightFor(width: constraints.maxWidth),
        child: Gallery(constraints)
    );
  }
}





class HomePage extends StatefulWidget {
  static final double designPaddingLR = 129;
  static const MediaDim homeBody = MediaDim(
    60, 40, 40
  );
  final bool portfolioRoute;
  const HomePage({this.portfolioRoute = false});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAwarePlus, RouteObserverMixin<HomePage>{
  Widget _buildLargeScreen(BuildContext context, BoxConstraints constraints) {
    final lcolConstraints = BoxConstraints(
      maxWidth: HomeLCol.screenWidthLD,
      maxHeight: constraints.maxHeight,
    );

    final rcolConstraints = BoxConstraints(
      maxWidth: HomeRCol.screenWidthLD,
      maxHeight: constraints.maxHeight,
    );

    _D.d(()=>'rebuild _buildLargeScreen homeL(${HomeLCol.screenWidthLD}), homeR(${HomeRCol.screenWidthLD})');
    return IntrinsicHeight(
      child: BoundingBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /// if we use expanded here would cause an unbounded height definition
            /// on Column, which entails some render problem, hence we need to
            /// use IntrinsincHeight to wrap on top of Column
            Expanded(
              child: Paddings.homePadding(
                child: Paddings.homeBodyTop(
                  size: HomePage.homeBody.large,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /// _buildLeftCol(context),
                      /// ----------------------------------------------------------
                      /// note: [Expanded] flex: 1.. here is neccsssary
                      /// The reason why [Expanded] here is neccessary is that,
                      /// the following Colum[HomeRCol] has a restrict width, so that
                      /// [Expanded] could get it's available space to fill the rest.
                      Expanded(child:HomeLCol(lcolConstraints)),
                      BoundingBox(child: Paddings.gallery(
                        child: HomeRCol(rcolConstraints),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            HomeFooter.large()
          ],
        ),
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context, BoxConstraints constraints) {
    _D.d(()=>'rebuild _buildMediumScreen home');
    final rcolConstraints = BoxConstraints(
      maxWidth: constraints.maxWidth - ScreenUtil.largeDesign.setWidth(HomePage.designPaddingLR)*2,
      maxHeight: constraints.maxHeight,
    );
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Paddings.homePadding(
              child: Paddings.homeBodyTop(
                size: HomePage.homeBody.medium,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: HomeLCol(constraints)),
                  ],
                ),
              ),
            ),
          ),
          Paddings.homePadding(
              child: HomeRCol(rcolConstraints)),
          HomeFooter.large()
        ],
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context, BoxConstraints constraints) {
    _D.d(()=>'rebuild _buildSmallScreen home');
    return Stack(
      children: <Widget>[
        IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Paddings.homePadding(
                  child: Paddings.homeBodyTop(
                  size: HomePage.homeBody.small,
                  /// using [Row] here is necessary, since [Expanded] must be placed
                  /// directly inside [Flex] widgets (Column/Row/...)
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: HomeLCol(constraints)),
                    ],
                  )),
                )
              ),
              Paddings.gallerySmallMedium(child: HomeRCol(constraints)/*480*/),
              HomeFooter.small()
            ],
          ),
        ),

      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    if (!visible)
      return Container();

    return LayoutBuilder(
        key: ValueKey("HomePage"),
        builder: (context, constraints) {
          _D.d(()=>'rebuild home layout builder, ${constraints.maxWidth}');
          return SingleChildScrollView(
            child: ResponsiveScreen(
              key: const ValueKey("HomeLayoutResponsive"),
              largeScreen : ((_buildLargeScreen(context, constraints))),
              mediumScreen: (_buildMediumScreen(context, constraints)),
              smallScreen : (_buildSmallScreen(context, constraints)),
            ),
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose'
    _D.i(()=>('home dispose mounted: ${mounted}'));
    super.dispose();
  }


  /// Called when the current route has been pushed.
  @override
  void didPush(){
  }

  /// Called when the current route has been popped off.
  @override
  void didPop(){
    _D.i(()=>('pop home'));
    dispose();
  }

  ///
  /// note:
  /// Called when a new route has been pushed, and the current route is no
  /// longer visible. Hide widget benifits rendering performance while multiple
  /// overlays stacked together....
  ///
  /// for futher information see [RouteAwarePlus]
  @override
  void didPushNext(){
    super.didPushNext();
  }

  /// Called when the top route has been popped off, and the current route
  /// shows up.
  @override
  void didPopNext(){
    super.didPopNext();
  }
}
