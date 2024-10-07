part of 'indicators.dart';

const _defaultVector = 'assets/vector/triangle_indicator_1.svg';

final class AssetIndicator extends StatelessWidget {
  final String? assetPath;
  final Size? dimension;
  final ColorFilter? colorFilter;

  const AssetIndicator({
    this.assetPath,
    this.dimension = const Size(30, 30),
    this.colorFilter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath ?? _defaultVector,
      width: dimension?.width,
      height: dimension?.height,
      colorFilter: colorFilter,
    );
  }
}
