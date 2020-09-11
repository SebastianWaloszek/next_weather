import 'package:flutter/material.dart';

class RectangularNetworkImage extends StatelessWidget {
  final String imageUrl;

  final double size;
  final EdgeInsets margin;

  const RectangularNetworkImage({
    Key key,
    @required this.imageUrl,
    this.size,
    this.margin,
  })  : assert(imageUrl != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: margin,
      child: _buildImage(),
    );
  }

  Widget _buildImage() {
    return Image.network(
      imageUrl,
    );
  }
}
