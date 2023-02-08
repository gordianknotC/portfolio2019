class STRINGS {

  STRINGS._();
  static const String about_me        = 'About Me';
  static const String about           = 'About';
  static const String Eabout          = 'About';
  static const String cAbout_me       = ' 關於我';
  static const String CheadlineMyself = '工業設計師, 機構設計師, 網頁設計師, 電子立樂創作人, 一半理智, 一半感性, 一半邏輯, 一半藝術';
  
  static const String me              = ' Me';
  static const String portfoli        = 'Portfoli';
  static const String o               = 'o';
  static const String headline        = 'I\'am Zubair Rehman, Mobile App Developer from Islamabad, Pakistan';
  static const String summary         = 'Focused professional having excellent technical and communication skills, and offering 6 years of experience in Computer industry. Proficient at designing and formulating test automation frameworks, writing code in various languages, feature development and implementation. Specialize in thinking outside the box to find unique solutions to difficult engineering problems.';
  static const String experience      = 'Experience';
  static const String skills_i_have   = 'What Skill I Have';
  
  // footer
  static const String rights_reserved = '© 2019 PORTFOLIO made with ';

  // menu items
  static const String menu_home      = 'Home';
  static const String menu_about     = 'About';
  static const String menu_contact   = 'Contact';
  static const String menu_portfolio = 'Portfolio';
  static const String menu_audioTest = 'AudioTest';

  static const String menu_vue = 'Vuejs portfolio';
  static const String menu_nwjs = 'NWjs portfolio';
  static const String menu_flash = 'Flash portfolio';
  

  // keywords - Chinese
  static const String CIpc           = '工業電腦';
  static const String Cpendrive      = '隨身碟';
  static const String Cheadphone     = '耳機';
  static const String CgamingMouse   = '電競滑鼠';
  static const String Ckeyboard      = '鍵盤';
  static const String Cneed          = '需求';
  static const String CserviceDesign = '服務設計';
  
  // gallery
  static const String gallery_hdapp       = "UI Design for Human Design App";
  static const String gallery_sketchImage = "My Drawings and Product Design Sketches";
  static const String gallery_revolver    = "Gaming Mouse Design";
  static const String gallery_camouflage  = "Gaming Mouse Design";
  static const String gallery_driftsand   = "Office Mouse Design";
  static const String gallery_exia        = "Gaming Mouse Design";
  static const String gallery_ipc         = "Mechanical Design for IPC";
  static const String gallery_mplamp      = "Concept Design";
  static const String gallery_nfcapp      = "Programming Design for NFC App";
  static const String gallery_petmate     = "Concept Design";
  static const String gallery_pluto       = "Office Mouse Design";
  static const String gallery_radiolamp   = "Concept Design";
  static const String gallery_scorpio     = "Gaming Mouse Design";
}

class TtooltipLink{
  final String link;
  final String tooltip;
  const TtooltipLink(this.link, this.tooltip);
}

class LINKS{
  static const String baseHome = "http://yesdesign.dynu.net:12345";
  static const String portfolioHome = "$baseHome/portfolio/#/";
  static const String hdPrototype = "$portfolioHome/demo/humandesign";
  static const String hdapp       = "$portfolioHome/index/portfolioHdapp";
  static const String sketch      = "$portfolioHome/index/portfolioSketch";
  static const String revolver    = "$portfolioHome/index/portfolioRevolver";
  static const String camouflage  = "$portfolioHome/index/portfolioCamouflage";
  static const String driftsand   = "$portfolioHome/index/portfolioDriftsand";
  static const String merrcurius =  "$portfolioHome/index/portfolioMercurius";
  static const String exia        = "$portfolioHome/index/portfolioExia";
  static const String ipc         = "$portfolioHome/index/hdapp";
  static const String mplamp      = "$portfolioHome/index/portfolioMPLamp";
  static const String nfcapp      = "$portfolioHome/index/portfolioNfcapp";
  static const String petmate     = "$portfolioHome/index/portfolioPetmate";
  static const String pluto       = "$portfolioHome/index/portfolioPluto";
  static const String radiolamp   = "$portfolioHome/index/portfolioRadiolamp";
  static const String keyboard    = "$portfolioHome/index/portfolioKeyboard";
  static const String scorpio     = "$portfolioHome/index/portfolioScorpion";
  static const String pendrive    = "$portfolioHome/index/portfolioPendrive";
  
  static const String portfolio_vue     = "$portfolioHome";
  static const String portfolio_nw_win  = "$baseHome/fileServing/wind32.rar";
  static const String portfolio_nw_mac  = "$baseHome/fileServing/osx32.rar";
  static const String portfolio_flash   = "$baseHome/flashweb/index.html";
}

class TooltipLinks{
  static const TtooltipLink portfolioHome = TtooltipLink(LINKS.portfolioHome, "link to: ${LINKS.portfolioHome}");
  static const TtooltipLink hdPrototype =  TtooltipLink(LINKS.hdPrototype, "link to: ${LINKS.hdPrototype}");
  static const TtooltipLink hdapp       =  TtooltipLink(LINKS.hdapp, "link to: ${LINKS.hdapp}");
  static const TtooltipLink sketch      =  TtooltipLink(LINKS.sketch, "link to: ${LINKS.sketch}");
  static const TtooltipLink revolver    =  TtooltipLink(LINKS.revolver, "link to: ${LINKS.revolver}");
  static const TtooltipLink camouflage  =  TtooltipLink(LINKS.camouflage, "link to: ${LINKS.camouflage}");
  static const TtooltipLink driftsand   =  TtooltipLink(LINKS.driftsand, "link to: ${LINKS.driftsand}");
  static const TtooltipLink merrcurius =   TtooltipLink(LINKS.merrcurius, "link to: ${LINKS.merrcurius}");
  static const TtooltipLink exia        =  TtooltipLink(LINKS.exia, "link to: ${LINKS.exia}");
  static const TtooltipLink ipc         =  TtooltipLink(LINKS.ipc , "link to: ${LINKS.ipc}");
  static const TtooltipLink mplamp      =  TtooltipLink(LINKS.mplamp, "link to: ${LINKS.mplamp}");
  static const TtooltipLink nfcapp      =  TtooltipLink(LINKS.nfcapp, "link to: ${LINKS.nfcapp}");
  static const TtooltipLink petmate     =  TtooltipLink(LINKS.petmate, "link to: ${LINKS.petmate}");
  static const TtooltipLink pluto       =  TtooltipLink(LINKS.pluto, "link to: ${LINKS.pluto}");
  static const TtooltipLink radiolamp   =  TtooltipLink(LINKS.radiolamp, "link to: ${LINKS.radiolamp}");
  static const TtooltipLink keyboard    =  TtooltipLink(LINKS.keyboard, "link to: ${LINKS.keyboard}");
  static const TtooltipLink scorpio     =  TtooltipLink(LINKS.scorpio, "link to: ${LINKS.scorpio}");
  static const TtooltipLink pendrive    =  TtooltipLink(LINKS.pendrive, "link to: ${LINKS.pendrive}");
}


class ROUTE{
  static const Iterable<String> homeRelated = [
    ROUTE.HOME, ROUTE.PORTFOLIO
  ];
  
  static const String BLANK      = '/';
  static const String HOME      = '/home';
  static const String CONTACT   = '/contact';
  static const String PORTFOLIO = '/portfolio';
  static const String PORTFOLIO_NWJS = '/portfolio_nwjs';
  static const String PORTFOLIO_FLASH = '/portfolio_flash';
  static const String AUDIOTEST = '/audioTest';
}

