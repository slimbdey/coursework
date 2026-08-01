import 'dart:io';

import 'package:image/image.dart';

/// Pads/scales the logo so the full hexagon fits inside Android 12+ splash
/// circle (safe diameter is 2/3 of the icon image).
void main() {
  final source = decodeImage(
    File('assets/images/logo.png').readAsBytesSync(),
  )!;

  // Slightly under 2/3 so anti-aliased tips stay inside the mask.
  const scale = 0.62;
  final targetSize = source.width;
  final logoSize = (targetSize * scale).round();

  final resized = copyResize(
    source,
    width: logoSize,
    height: logoSize,
    interpolation: Interpolation.average,
  );

  final canvas = Image(width: targetSize, height: targetSize, numChannels: 4);
  final offset = ((targetSize - logoSize) / 2).round();
  compositeImage(canvas, resized, dstX: offset, dstY: offset);

  File('assets/images/logo_android12_splash.png').writeAsBytesSync(
    encodePng(canvas),
  );
  print(
    'Wrote assets/images/logo_android12_splash.png '
    '(${targetSize}x$targetSize, logo ${logoSize}x$logoSize)',
  );
}
