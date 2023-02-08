import 'package:dart_common/dart_common.dart';
import 'package:layout_widgets/src/widgets/stateful.dart';
import 'package:layout_widgets/src/util.dart';
import 'package:universal_html/html.dart';
//import 'package:universal_html/js.dart'; //note: cannot import this under android platform


void mobileFullScreenUX(){
	print('IS_MOBILE: $IS_MOBILE');
	if (IS_MOBILE){
		final body = querySelector('body') as BodyElement;
		body.requestFullscreen();
	}else{

	}
}

void disableLogsInProduction(){
	if (buildMode == EBuildMode.release){
		// Logger.production = true;
		// appEnv.env = Env.release;
	}
}


void getPreloadImages({String id = "#preload_hidden", required void onLoad(ImageElement elt)}){
	final List<ImageElement> images = querySelectorAll('$id>img');
	images.forEach((ImageElement img){
		img.onLoad.asBroadcastStream().listen((_){
			onLoad(img);

		});
	});
}



