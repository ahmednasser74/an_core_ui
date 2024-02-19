import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AppContainerImgType { asset, network, file }

class AppContainer extends StatelessWidget {
  const AppContainer({
    Key? key,
    this.child,
    this.paddingHorizontal,
    this.paddingVertical,
    this.color,
    this.borderColor,
    this.borderWidth = 1,
    this.borderRadius,
    this.shadowOffset = Offset.zero,
    this.shadowBlurColor,
    this.height,
    this.width,
    this.alignment,
    this.shadowSpreadRadius = 0,
    this.constraints,
    this.shape,
    this.onTap,
    this.image,
    this.imgType = AppContainerImgType.asset,
    this.fit,
    this.gradientBegin,
    this.gradientEnd,
    this.gradientColors,
    this.borderRadiusTopRight,
    this.borderRadiusBottomRight,
    this.borderRadiusTopLeft,
    this.borderRadiusBottomLeft,
    this.paddingAll,
    this.marginAll,
    this.marginTop,
    this.marginBottom,
    this.marginLeft,
    this.marginRight,
    this.marginHorizontal,
    this.marginVertical,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
  }) : super(key: key);

  final Widget? child;
  final Color? color, borderColor, shadowBlurColor;
  final VoidCallback? onTap;
  final double borderWidth, shadowSpreadRadius;
  final Offset? shadowOffset;
  final Alignment? alignment;
  final BoxConstraints? constraints;
  final BoxShape? shape;
  final dynamic image;
  final BoxFit? fit;
  final AppContainerImgType? imgType;
  final AlignmentGeometry? gradientBegin, gradientEnd;
  final List<Color>? gradientColors;
  final double? height, width;
  final double? paddingAll, paddingTop, paddingBottom, paddingLeft, paddingRight, paddingHorizontal, paddingVertical;
  final double? marginAll, marginTop, marginBottom, marginLeft, marginRight, marginVertical, marginHorizontal;
  final double? borderRadius, borderRadiusTopRight, borderRadiusBottomRight, borderRadiusTopLeft, borderRadiusBottomLeft;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: _padding,
        margin: _margin,
        alignment: alignment,
        constraints: constraints,
        decoration: BoxDecoration(
          color: color,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: _buildBorderRadius,
          border: _border(context),
          image: image != null ? DecorationImage(image: _buildImage(), fit: fit) : null,
          gradient: _gradient(context),
          boxShadow: _boxShadow(context),
        ),
        child: child,
      ),
    );
  }

  ImageProvider _buildImage() {
    switch (imgType) {
      case AppContainerImgType.asset:
        return AssetImage(image);
      case AppContainerImgType.network:
        return NetworkImage(image);
      case AppContainerImgType.file:
        return FileImage(image);
      default:
        return AssetImage(image!);
    }
  }

  // borderRadius: borderRadius != null ? BorderRadius.circular(borderRadius!.r) : null,
  BorderRadiusGeometry? get _buildBorderRadius {
    if (borderRadius != null) {
      return BorderRadius.circular(borderRadius!.r);
    }
    if (borderRadiusTopRight != null || borderRadiusBottomRight != null || borderRadiusTopLeft != null || borderRadiusBottomLeft != null) {
      return BorderRadius.only(
        topRight: borderRadiusTopRight != null ? Radius.circular(borderRadiusTopRight!.r) : Radius.zero,
        bottomRight: borderRadiusBottomRight != null ? Radius.circular(borderRadiusBottomRight!.r) : Radius.zero,
        topLeft: borderRadiusTopLeft != null ? Radius.circular(borderRadiusTopLeft!.r) : Radius.zero,
        bottomLeft: borderRadiusBottomLeft != null ? Radius.circular(borderRadiusBottomLeft!.r) : Radius.zero,
      );
    }
    return null;
  }

  EdgeInsetsGeometry get _margin {
    if (marginAll != null) {
      return EdgeInsets.all(marginAll!);
    }
    if (marginTop != null || marginBottom != null || marginLeft != null || marginRight != null) {
      return EdgeInsetsDirectional.only(
        top: marginTop ?? 0,
        bottom: marginBottom ?? 0,
        start: marginLeft ?? 0,
        end: marginRight ?? 0,
      );
    }
    if (marginVertical != null || marginHorizontal != null) {
      return EdgeInsets.symmetric(vertical: marginVertical ?? 0, horizontal: marginHorizontal ?? 0);
    }
    return EdgeInsets.zero;
  }

  EdgeInsetsGeometry get _padding {
    if (paddingAll != null) {
      return EdgeInsets.all(paddingAll!);
    }
    if (paddingTop != null || paddingBottom != null || paddingLeft != null || paddingRight != null) {
      return EdgeInsetsDirectional.only(
        top: paddingTop ?? 0,
        bottom: paddingBottom ?? 0,
        start: paddingLeft ?? 0,
        end: paddingRight ?? 0,
      );
    }
    if (paddingVertical != null || paddingHorizontal != null) {
      return EdgeInsets.symmetric(vertical: paddingVertical ?? 0, horizontal: paddingHorizontal ?? 0);
    }
    return EdgeInsets.zero;
  }

  BoxBorder? _border(BuildContext context) {
    if (borderColor != null) {
      return Border.all(color: borderColor ?? Theme.of(context).primaryColor, width: borderWidth);
    }
    return null;
  }

  Gradient? _gradient(BuildContext context) {
    if (gradientColors != null) {
      return LinearGradient(
        begin: gradientBegin ?? Alignment.topCenter,
        end: gradientEnd ?? Alignment.bottomCenter,
        colors: [...gradientColors!],
      );
    }
    return null;
  }

  List<BoxShadow>? _boxShadow(BuildContext context) {
    if (shadowBlurColor != null || shadowOffset != null) {
      return [
        BoxShadow(
          color: shadowBlurColor?.withOpacity(.7) ?? Colors.transparent,
          offset: shadowOffset ?? const Offset(0, 0),
          blurRadius: 8,
          spreadRadius: shadowSpreadRadius,
        )
      ];
    }
    return null;
  }
}
