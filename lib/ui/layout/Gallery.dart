import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_common/dart_common.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout_widgets/src/screen/screen_utils.dart';
import 'package:layout_widgets/src/widgets/context_widget.dart';
import 'package:layout_widgets/src/widgets/responsive_widget.dart';
import 'package:layout_widgets/src/widgets/stateful.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/constants/keys.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/models/models.dart';
import 'package:portfolio/ui/pages/home/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as _path;

final _D = Logger.filterableLogger(moduleName: 'Galry');

/// 	-----------------
/// 	|		image1~N    |
/// 	|								|
/// 	|	base carousel	|		[BaseCarousel]
/// 	|								|
/// 	|---------------|
///
/// 	|---------------|
/// 	|product design |
/// 	|		infograph   |		[InfoGraph]
/// 	|---------------|
///
/// 	|---------------|
/// 	| 1 2 3 ....    |
/// 	| base indicator|		[BaseCarouselIndicator]
/// 	|---------------|
///

class InfoGraph extends StatelessWidget {
  static const TextSpan PRODUCT_DESIGN = TextSpan(children: [
    TextSpan(text: "Product ", style: TextStyles.galleryCateAccent),
    TextSpan(text: "Design", style: TextStyles.galleryCate),
  ]);

  static const TextSpan UI_DESIGN = TextSpan(children: [
    TextSpan(text: "UI ", style: TextStyles.galleryCateAccent),
    TextSpan(text: "Design", style: TextStyles.galleryCate),
  ]);

  static const TextSpan PROGRAMMING_DESIGN = TextSpan(children: [
    TextSpan(text: "Programming ", style: TextStyles.galleryCateAccent),
    TextSpan(text: "Design", style: TextStyles.galleryCate),
  ]);

  static const TextSpan WEB_DESIGN = TextSpan(children: [
    TextSpan(text: "Web ", style: TextStyles.galleryCateAccent),
    TextSpan(text: "Design", style: TextStyles.galleryCate),
  ]);

  final TextSpan title;
  final String description;
  final String link;

  const InfoGraph(
      {required this.title, required this.description, required this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _D.d(() => 'ontap...');
        launch(link);
      },
      child: Tooltip(
        textStyle: TextStyles.bodyLink,
        message: "link to porfolio:\n...${_path.basename(link)}",
        child: Text.rich(
          TextSpan(
            children: [
              title,
              TextSpan(
                  text: "\n$description",
                  style: TextStyles.p.copyWith(
                      color: MColors.skillText, fontFamily: Fonts.Khand)),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TGalleryImage {
  final String url;
  final String description;
  final TextSpan title;
  final String link;

  const TGalleryImage(
      {required this.url,
      required this.description,
      required this.title,
      required this.link});
}

class BaseCarouselUnit extends StatefulWidget {
  final String src;
  final double width;
  final double height;

  const BaseCarouselUnit(
      {required this.src, required this.width, required this.height});

  @override
  _BaseCarouselUnitState createState() => _BaseCarouselUnitState();
}

class _BaseCarouselUnitState extends State<BaseCarouselUnit> {
  @override
  Widget build(BuildContext context) {
    final w = widget.width;
    final h = widget.height;
    return Container(
      width: w, height: h,
      child: Image.asset(widget.src,
          height: h,
          width: w,
          fit: BoxFit
              .fitHeight), //ScreenUtil.getInstance().setWidth(HomeRCol.imageDesignWidth)),
    );
  }
}

class BaseCarouselIndicator extends StatelessWidget {
  final Color active = MColors.textAccent;
  final Color inactive = MColors.menuInactive;
  final int indexer;
  final int current;

  const BaseCarouselIndicator({required this.current, required this.indexer});

  @override
  Widget build(BuildContext context) {
    final double size = indexer == current ? 16.0 : 12.0;
    final color = indexer == current ? MColors.textAccent : MColors.textDark;
    return Container(
        width: size,
        height: size,
        alignment: AlignmentDirectional.bottomCenter,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Icon(GalleryModel.indicatorMapping[indexer],
            color: color, size: size));
  }
}

class BaseCarousel extends StatefulWidget {
  final List<TGalleryImage> images;
  final Widget Function(BuildContext ctx, int order, TGalleryImage img)
      galleryBuilder;
  final Widget Function(BuildContext ctx, int order, int current)
      indicatorBuilder;
  final Widget Function(BuildContext ctx, CarouselSlider slider,
      List<Widget> indicators, int current) layoutBuilder;
  final CarouselSlider Function(List<Widget> gallery, BaseCarouselState state)
      carouselBuilder;

  const BaseCarousel({
    required this.images,
    required this.galleryBuilder,
    required this.indicatorBuilder,
    required this.layoutBuilder,
    required this.carouselBuilder,
  });

  @override
  BaseCarouselState createState() => BaseCarouselState();
}

class BaseCarouselState extends State<BaseCarousel> {
  int currentIndex = 0;
  List<Widget>? gallery;
  List<Widget>? indicators;
  List<InfoGraph>? infos;
  CarouselSlider? carousel;

  @override
  Widget build(BuildContext context) {
    gallery = List.generate(widget.images.length, (i) {
      final img = widget.images[i];

      return widget.galleryBuilder(context, i, img);
    });

    indicators = List.generate(widget.images.length, (i) {
      return widget.indicatorBuilder(context, i, currentIndex);
    });

    carousel ??= widget.carouselBuilder(gallery!, this);
    return widget.layoutBuilder(context, carousel!, indicators!, currentIndex);
  }
}

///
///
/// 	[Gallery]
/// 	|____[_GalleryBaseLayout] __________[BaseCarouselIndicator]
/// 					|____[_GalleryLarge]     |__[BaseCarouselUnit] image holder
/// 					|____[_GallerySmall]		 |__[CarouselSlider]
/// 					|____[_GalleryMedium]		 |__[InfoGraph] information about current image
///
///
///
class _GalleryBaseLayout extends StatelessWidget {
//	static final Widget flashLight = SvgPicture.asset(
//			Assets.flashBg,
//	);
  final double whRatio;
  final Key contextKey;

  const _GalleryBaseLayout(
      {this.whRatio = HomeRCol.imageDesignWidth / HomeRCol.imageDesignHeight,
      this.contextKey = Keys.galleryKey});

  Widget base({required double w, required double h}) {
    final child = BaseCarousel(
      images: GalleryModel.gallery,
      galleryBuilder: (BuildContext ctx, int index, TGalleryImage image) {
        return BaseCarouselUnit(src: image.url, width: w, height: h);
      },
      indicatorBuilder: (BuildContext ctx, int index, int current) {
        return BaseCarouselIndicator(current: current, indexer: index);
      },
      carouselBuilder: (List<Widget> gallery, state) {
        return CarouselSlider(
          items: gallery,
          options: CarouselOptions(
            height: h,
            viewportFraction: 1.0,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              state.setState(() {
                // ignore: invalid_use_of_protected_member
                state.currentIndex = index;
              });
            },
          ),
        );
      },
      layoutBuilder:
          (BuildContext ctx, CarouselSlider slider, indicators, current) {
        final gdata = GalleryModel.gallery[current];
        return Column(mainAxisSize: MainAxisSize.min, children: [
          /// limit
          Container(width: w, height: h, child: slider),
          Align(
              alignment: Alignment.center,
              child: InfoGraph(
                  title: gdata.title,
                  description: gdata.description,
                  link: gdata.link)),
          Container(
            width: w * 0.5,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: indicators,
            ),
          ),
        ]);
      },
    );
    return ContextKeeper(Keys.galleryKey,
        child: child, screenSizeNotifier: ScreenUtil.screenSizeNotifier);
//		return Container(
//			width: w,
//			height: h + 130,
//			child: child
//		);
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('gallery base layout not implemented yet');
  }
}

class _GalleryLarge extends _GalleryBaseLayout {
  final BoxConstraints constraints;

  const _GalleryLarge(this.constraints);

  @override
  Widget build(BuildContext context) {
    final w = constraints.maxWidth -
        ScreenUtil.largeDesign.setWidth(HomeRCol.imageDesignPaddingR);
    final h = w / whRatio;
    _D.d(() => 'set gallery large h/w ($h/$w)');
    return super.base(w: w, h: h);
  }
}

class _GalleryMedium extends _GalleryBaseLayout {
  final BoxConstraints constraints;

  const _GalleryMedium(this.constraints);

  @override
  Widget build(BuildContext context) {
    final w = (constraints.maxWidth -
            ScreenUtil.largeDesign.setWidth(HomeRCol.imageDesignPaddingR)) *
        0.7;
    final h = w / whRatio;
    _D.d(() => 'set gallery medium h/w ($h/$w)');
    return super.base(w: w, h: h);
  }
}

class _GallerySmall extends _GalleryBaseLayout {
  final BoxConstraints constraints;

  const _GallerySmall(this.constraints);

  @override
  Widget build(BuildContext context) {
    final w = constraints.maxWidth -
        ScreenUtil.largeDesign.setWidth(HomeRCol.imageDesignPaddingR);
    final h = w / whRatio;
    _D.d(() => 'set gallery small h/w ($h/$w)');
    return super.base(w: w, h: h);
  }
}

// fixme:
// add two constant
// one for
class Gallery extends StatelessWidget {
  /// a constraints is necessary, since no visual constraints
  /// with animated children entails flutter constantly rebuilds...
  final BoxConstraints constraints;

  const Gallery(this.constraints);

  @override
  Widget build(BuildContext context) {
    final size = IS_MOBILE ? SIZE_GALLERY : SIZE_DESKTOP;
    final gallery = _GalleryBaseLayout();
    final w = constraints.maxWidth -
        ScreenUtil.largeDesign.setWidth(HomeRCol.imageDesignPaddingR);
    final h = w / gallery.whRatio;
    _D.d(() => 'set gallery h/w ($h/$w)');
//		return gallery.base(w: w, h: h);
    final media = TRWMedia.fromConstaints(constraints);
    final responsive = ResponsiveElt(
        responsiveSize: size,
        media: media,
        large: _GalleryLarge(constraints),
        medium: _GalleryMedium(constraints),
        small: _GallerySmall(constraints));
    _D.d(() => 'isLarge :	${responsive.isLargeOrMedium(media)}');
    _D.d(() => 'isMedium: ${responsive.isMedium(media)}');
    _D.d(() => 'isSmall : ${responsive.isSmall(media)}');
    return responsive;
  }
}
