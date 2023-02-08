
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Keys{
	static final String audioGroupKey = shortHash(UniqueKey());
	static const Key appLayout = ValueKey("AppLayout");
	static const Key skillMusicAudioGroup = ValueKey("SkillMusicAudioGroup");
	static const Key skillMusicAudioGroupS1 = ValueKey("SkillMusicAudioGroup-sub1");
	static const Key skillMusicAudioGroupS2 = ValueKey("SkillMusicAudioGroup-sub2");
	static const Key skillMusicAudioGroupS3 = ValueKey("SkillMusicAudioGroup-sub3");
	static const Key skillMusicAudioGroupS4 = ValueKey("SkillMusicAudioGroup-sub4");
	static const Key galleryKey             = ValueKey("BaseCarouselGallery");
	
	static final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
	
}