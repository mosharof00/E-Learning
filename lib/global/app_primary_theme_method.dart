import 'package:flutter/cupertino.dart';

import '../gen/colors.gen.dart';

LinearGradient appLinearGradient() {
  return  LinearGradient(
    begin: const Alignment(-0.68, 0.73),
    end: const Alignment(0.68, -0.73),
    colors: [ColorName.primary, ColorName.secondPrimary],
  );
}


