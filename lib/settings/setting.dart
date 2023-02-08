import 'dart:io';

import 'package:dart_common/dart_common.dart';
import 'package:layout_widgets/src/widgets/debugs.dart';

class AppSetting {
	static Directory? appDirectory;
	static late AppSetting _instance;
	static bool _boxDebug = true;
	static bool _logDebug = true;
	static bool get logDebug => _logDebug;
	static 		  set logDebug (bool v) {
		_logDebug = v;
		// if (v) 	Logger.production = false;
		// else  	Logger.production = true;
	}

	static bool get boxDebug => _boxDebug;
	static 		  set boxDebug (bool v) {
		_boxDebug = v;
		if (v) 	BoundingBox.setBoxDebugOn();
		else  	BoundingBox.setBoxDebugOff();
	}

	factory AppSetting.F(){
		if (_instance == null) {
		  return _instance = AppSetting._();
		}
		return _instance;
	}

	AppSetting._();
}
