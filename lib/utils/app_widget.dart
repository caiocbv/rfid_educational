import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:nb_utils/nb_utils.dart';

Widget text(
  String? text, {
  var fontSize = 18.0,
  Color? textColor,
  var fontFamily,
  var isCentered = false,
  var isLeft = false,
  var maxLine = 1,
  var latterSpacing = 0.5,
  bool textAllCaps = false,
  var isLongText = false,
  bool lineThrough = false,
  bool isBold = false,
  bool isShadow = false,
}) {
  return Text(
    textAllCaps ? text!.toUpperCase() : text!,
    textAlign: isCentered ? TextAlign.center : isLeft? TextAlign.left : TextAlign.justify,
    maxLines: isLongText ? 5 : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: textColor ?? textSecondaryColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration: lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      shadows: [
        Shadow(
          offset: isShadow ? Offset(2.0, 2.0): Offset(0.0, 0.0),
          blurRadius: 3.0,
          color: Colors.grey.withOpacity(0.5),
        ),
      ],
    ),
  );
}

BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color? bgColor, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow ? defaultBoxShadow(shadowColor: shadowColorGlobal) : [ const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
}

Widget commonCacheImageWidget(String? url, {double? height, double? width, BoxFit? fit}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorWidget: (_, __, ___) {
          return SizedBox(height: height, width: width);
        },
      );
    } else {
      return Image.network(url!, height: height, width: width, fit: fit ?? BoxFit.cover);
    }
  } else {
    return Image.asset(url!, height: height, width: width, fit: fit ?? BoxFit.cover);
  }
}

class CustomTheme extends StatelessWidget {
  final Widget? child;

  const CustomTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: child!,
    );
  }
}

Widget? Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('images/quiz/empty_image_placeholder.jpg', fit: BoxFit.cover);

String parseHtmlString(String? htmlString) {
  return parse(parse(htmlString).body!.text).documentElement!.text;
}
