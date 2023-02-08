import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:layout_widgets/src/models/tag.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/strings.dart';
import 'package:portfolio/icons/my_flutter_app_icons.dart';
import 'package:layout_widgets/src/widgets/tag.dart';
import 'package:portfolio/ui/layout/Gallery.dart';


class Education {
  String from;
  String to;
  String organization;
  String post;

  Education(this.from, this.to, this.organization, this.post);
}


class MediaDim {
  final double small;
  final double medium;
  final double large;
  const MediaDim(this.small, this.medium, this.large);
}


class SkillModel{
  static const IconData industrialDesignIcon = CustomIcons.id_icon;
  static const IconData uiDesignIcon = CustomIcons.ui_icon;
  static const IconData programmingDesignIcon = CustomIcons.programming_icon;
  static const IconData musicIcon = CustomIcons.library_music;
  // --------------------------
  static const solidworks     = Ttag(name: "SolidWorks");
  static const sldComposer    = Ttag(name: "Sld Composer");
  static const SketchBook     = Ttag(name: "SketchBook");
  static const Showcase       = Ttag(name: "Showcase");
  static const Alias          = Ttag(name: "Alias");
  static const modo           = Ttag(name: "The Foundry modo");
  // --------------------------
  static const Dart           = Ttag(name: "Dart", icon: CustomIcons.dartlang);
  static const Javascript     = Ttag(name: "Javascript", icon: CustomIcons.language_javascript__1_);
  static const nwjs           = Ttag(name: 'nwjs');
  static const Vue            = Ttag(name: "Vue", icon: CustomIcons.vuejs);
  static const Flutter        = Ttag(name: "Flutter", icon: CustomIcons.flutter_seeklogo_com);
  static const python         = Ttag(name: "python", icon: CustomIcons.language_python);
  static const html           = Ttag(name: "html/css/stylus", icon: CustomIcons.language_html5);
  static const flash           = Ttag(name: "flash", icon: Icons.flash_on);
  // --------------------------
  static const Ilustrator     = Ttag(name: "Ilustrator");
  static const Affinity       = Ttag(name: "Affinity Designer");
  static const Photoshop      = Ttag(name: "Photoshop");
  static const Figma          = Ttag(name: "Figma");
  // --------------------------
  static const Propellerheads = Ttag(name: "Propellerheads Reason");
  static const Audition       = Ttag(name: "Adobe Audition");
  // --------------------------
  static const List<Ttag> industrialDesign = [
    solidworks,
    sldComposer,
    SketchBook,
    Showcase,
    Alias,
    modo,
  ];

  static const List<Ttag> programmingDesign = [
    Dart,
    Javascript,
    nwjs,
    nwjs,
    Flutter,
    python,
    html,
  ];

  static const List<Ttag> uiDesign = [
    Ilustrator,
    Affinity,
    Photoshop,
    Figma,
  ];

  static const List<Ttag> musicComposition = [
    Propellerheads,
    Audition,
  ];
}

class GalleryModel{
  static const TGalleryImage hdapp       = TGalleryImage(url: Assets.hdapp, description: STRINGS.gallery_hdapp, title: InfoGraph.UI_DESIGN, link: LINKS.hdapp);
  static const TGalleryImage sketchImage = TGalleryImage(url: Assets.sketchImage, description: STRINGS.gallery_sketchImage, title: InfoGraph.PRODUCT_DESIGN, link: LINKS.sketch);
  static const TGalleryImage revolver    = TGalleryImage(url: Assets.revolver, description: STRINGS.gallery_revolver, title: InfoGraph.PRODUCT_DESIGN, link: LINKS.revolver);
  static const TGalleryImage camouflage  = TGalleryImage(url: Assets.camouflage, description: STRINGS.gallery_camouflage, title: InfoGraph.PRODUCT_DESIGN, link : LINKS.camouflage);
  static const TGalleryImage driftsand   = TGalleryImage(url: Assets.driftsand, description: STRINGS.gallery_driftsand, title: InfoGraph.PRODUCT_DESIGN, link: LINKS.driftsand);
  static const TGalleryImage exia        = TGalleryImage(url: Assets.exia, description: STRINGS.gallery_exia, title: InfoGraph.PRODUCT_DESIGN, link: LINKS.exia);
  static const TGalleryImage ipc         = TGalleryImage(url: Assets.ipc, description: STRINGS.gallery_ipc, title: InfoGraph.PRODUCT_DESIGN, link: LINKS.hdapp);
  static const TGalleryImage mplamp      = TGalleryImage(url: Assets.mplamp, description: STRINGS.gallery_mplamp, title: InfoGraph.PRODUCT_DESIGN, link: LINKS.mplamp);
  static const TGalleryImage nfcapp      = TGalleryImage(url: Assets.nfcapp, description: STRINGS.gallery_nfcapp, title: InfoGraph.PROGRAMMING_DESIGN, link: LINKS.nfcapp);
  static const TGalleryImage petmate     = TGalleryImage(url: Assets.petmate, description: STRINGS.gallery_petmate, title: InfoGraph.PRODUCT_DESIGN, link: LINKS.petmate);
  static const TGalleryImage pluto       = TGalleryImage(url: Assets.pluto, description: STRINGS.gallery_pluto, title: InfoGraph.PRODUCT_DESIGN, link: LINKS.pluto);
  static const TGalleryImage radiolamp   = TGalleryImage(url: Assets.radiolamp, description: STRINGS.gallery_radiolamp, title: InfoGraph.PRODUCT_DESIGN, link: LINKS.radiolamp);
  static const TGalleryImage scorpio     = TGalleryImage(url: Assets.scorpio, description: STRINGS.gallery_scorpio, title: InfoGraph.PRODUCT_DESIGN, link: LINKS.scorpio);
  // todo: web design
  static const List<TGalleryImage> gallery = [
    hdapp, sketchImage, revolver, camouflage, driftsand, exia, ipc,
    mplamp, nfcapp, petmate, pluto, radiolamp, scorpio,
  ];

  static const List<IconData> indicatorMapping = [
    CustomIcons.one,
    CustomIcons.two,
    CustomIcons.three,
    CustomIcons.four,
    CustomIcons.five,
    CustomIcons.six,
    CustomIcons.seven,
    CustomIcons.eight,
    CustomIcons.nine,
    CustomIcons.ten,
    CustomIcons.eleven,
    CustomIcons.twelve,
    CustomIcons.thirteen,
    CustomIcons.fourteen,
    CustomIcons.fifteen,
    CustomIcons.sixteen,
  ];
}


const _cloud_bg_color = MColors.skillEclipseBg;
const _cloud_icon_color = MColors.skillTitleIcon;
const _cloud_padding = Paddings.cloudPadding;
const _cloud_style = TextStyle(
  fontFamily: Fonts.product,
  color: MColors.skillText,
  height: 1.4,
  fontSize: 12.0, //12.0
  letterSpacing: 0.85,
  fontWeight: FontWeight.w200,
);

class CloudModel{
  static const flash = CloudTag(
    SkillModel.flash, bgColor: _cloud_bg_color,
    iconColor: _cloud_icon_color,
    padding: _cloud_padding,
    style: _cloud_style,
  );

  static const vuejs = CloudTag(
    SkillModel.Vue, bgColor: _cloud_bg_color,
    iconColor: _cloud_icon_color,
    padding: _cloud_padding,
    style: _cloud_style,
  );

  static const nwjs = CloudTag(
    SkillModel.nwjs, bgColor: _cloud_bg_color,
    iconColor: _cloud_icon_color,
    padding: _cloud_padding,
    style: _cloud_style,
  );


}
