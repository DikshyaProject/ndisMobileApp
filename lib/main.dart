
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'main_common.dart';

void main() {
  FlavorConfig(
      name: "Review",
      color: Colors.red,
      location: BannerLocation.bottomEnd,
      variables: {"developerBaseUrl": "BaseDevUrl"});

  initializeCommon();  //
}

