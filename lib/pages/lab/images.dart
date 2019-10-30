import 'package:flutter/material.dart';
import 'package:fluttercn/config.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: ListView(
        children: <Widget>[
          /// FadeInImage
          _getPadding(FadeInImage(
              height: 200,
              fit: BoxFit.cover,
              placeholder: AssetImage(Config.imgCoinAssets),
              image: NetworkImage(Config.imgNetGallery2))),
          _getPadding(FadeInImage.assetNetwork(
              height: 200,
              fit: BoxFit.fitWidth,
              placeholder: Config.logoUrl,
              image: Config.imgNetGallery3)),

          /// BlendMode
          _getPadding(Image(
            image: NetworkImage(Config.imgNetGallery3),
            color: Colors.pinkAccent,
            colorBlendMode: BlendMode.saturation,
          )),

          /// centerSlice
          _getPadding(_bubbleBody()),

          /// repeat
          _getPadding(Image.asset(
            Config.imgCoinAssets,
            repeat: ImageRepeat.repeat,
          )),

          /// Provider
          _getPadding(Image(
            image: AssetImage(Config.splashBg),
          )),
          _getPadding(Image(image: NetworkImage(Config.splashUrl))),

          /// BoxFit
          _getPadding(Image(
            image: NetworkImage(Config.imgNetGallery1),
            fit: BoxFit.fill,
            width: double.infinity,
            height: 100,
          )),
          _getPadding(Image(
              image: NetworkImage(Config.imgNetGallery1),
              fit: BoxFit.contain,
              width: double.infinity,
              height: 100)),
          _getPadding(Image(
              image: NetworkImage(Config.imgNetGallery1),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100)),
          _getPadding(Image(
              image: NetworkImage(Config.imgNetGallery1),
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 100)),
          _getPadding(Image(
              image: NetworkImage(Config.imgNetGallery1),
              fit: BoxFit.fitHeight,
              width: double.infinity,
              height: 100)),
          _getPadding(Image(
              image: NetworkImage(Config.imgNetGallery1),
              fit: BoxFit.none,
              width: double.infinity,
              height: 100)),
          _getPadding(Image(
              image: NetworkImage(Config.imgNetGallery1),
              fit: BoxFit.scaleDown,
              width: double.infinity,
              height: 100)),

          /// Image.xxx
          _getPadding(Image.asset(Config.splashBg)),
          _getPadding(Image.network(Config.splashUrl)),

          /// 圆形 & 圆角
          _getPadding(Row(
            children: <Widget>[
              Expanded(
                child: ClipOval(
                  child: Image.network(
                    Config.splashUrl,
                  ),
                ),
              ),
              VerticalDivider(
                width: 10,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(Config.splashUrl),
                radius: 50,
              ),
              VerticalDivider(
                width: 10,
              ),
              Expanded(
                  child: ClipRRect(
                child: Image.network(
                  Config.splashUrl,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
              VerticalDivider(
                width: 10,
              ),
              Expanded(
                  child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: NetworkImage(Config.splashUrl),
                        fit: BoxFit.cover)),
              ))
            ],
          )),

          /// Webp Gif
          _getPadding(Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Image.asset(
                  'animated_images/animated_flutter_stickers.webp',
                  package: 'flutter_gallery_assets',
                ),
              ),
              Expanded(
                  child: Image.asset(
                'animated_images/animated_flutter_lgtm.gif',
                package: 'flutter_gallery_assets',
              ))
            ],
          ))
        ],
      ),
    );
  }

  Widget _getPadding(Widget child) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  Widget _bubbleBody() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          centerSlice: Rect.fromLTWH(19, 13, 8, 8),
          image: AssetImage(
            Config.imgBubbleAssets,
          ),
        ),
      ),
      constraints: BoxConstraints(
        minWidth: 48,
        maxWidth: 480,
      ),
      padding: EdgeInsets.fromLTRB(18.5, 3.0, 14.5, 20.0),
      child: Text(
        '床前明月光\n疑似地上霜\n举头望明月\n低头思故乡\ntrue man does what he will, not what he must.',
        style: TextStyle(color: Colors.red, fontSize: 15.0),
      ),
    );
  }

  _imageCache() {
    /// 获取ImageCache 缓存对象
    ImageCache imageCache = PaintingBinding.instance.imageCache;

    /// 设置缓存图片的个数（根据情况自己设置，default = 1000）
    imageCache.maximumSize = 1000;

    /// 获取缓存图片个数
    int num = imageCache.currentSize;

    /// 设置缓存大小（根据情况自己设置，default = 50M）
    imageCache.maximumSizeBytes = 50 << 20;

    /// 获取图片缓存大小(单位是byte,需自行转换到 M)
    int byte = imageCache.currentSizeBytes;

    /// 清除图片缓存
    imageCache.clear();
  }

  _format() {
    Image.asset(
      Config.imgCoinAssets,
      repeat: ImageRepeat.repeat,
    );
  }
}
