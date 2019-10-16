Widget
===
万物皆Widget

## StatefulWidget&StatelessWidget
> Flutter 的核心设计思想便是: Everything is a Widget.
![widget](http://img.1991th.com/tuchongeter/tech/flutter.widget)

1. StatelessWidget:无中间状态变化的widget，需要更新展示内容就得通过重新new，flutter推荐尽量使用StatelessWidget
2. StatefullWidget:存在中间状态变化，那么问题来了，widget不是都immutable的，状态变化存储在哪里？flutter 引入state的类用于存放中间态，通过调用state.setState()进行此节点及以下的整个子树更新

### Text

### Image
1. Boxfit,相当于 Android 中的 ScaleType
  ![Boxfit](http://img.1991th.com/tuchongeter/tech/image.boxfit)
2. ImageProvider 支持不同情景下的图片加载
  ![Provider](http://img.1991th.com/tuchongeter/tech/image.provider)
3. 缓存
  ImageCache是ImageProvider默认使用的图片缓存。ImageCache使用的是LRU的算法。默认可以存储1000张图片。如果觉得缓存太大，可以通过设置ImageCache的maximumSize属性来控制缓存图片的数量。也可以通过设置maximumSizeBytes来控制缓存的大小（默认缓存大小10MB）。
4. 在实际开发中，考虑到图片加载速度可能不能达到预期。所以希望能增加渐入效果&增加placeHolder的功能。Flutter同样提供的这样的组件——FadeInImage。

### Container
相当于 Android 中的 ViewGroup
- BoxDecoration 提供了对背景色，边框，圆角，阴影和渐变等功能的定制能力。
- BoxConstraints 其实是对 Container 组件大小的描述。

###  GestureDetector
手势操作是最常见的UI交互操作。在Flutter中手势识别也是一个widget！使用时只需要将GestureDetector包裹在目标widget外面，再实现对应事件的函数即可。从点击到长按，从缩放到拖动，这个类基本上都有相应的实现。

### Flex
Flex是Flexible Box的缩写，意为”弹性布局”，用来为盒状模型提供最大的灵活性。[flex盒子模型](https://www.runoob.com/w3cnote/flex-grammar.html)
![flex](http://img.1991th.com/tuchongeter/tech/3791e575c48b3698be6a94ae1dbff79d.png)。Flutter在布局上也提供了完整的Flex布局能力。但是在Flutter官方文档中Layout Widgets，是看不到任何Flex的影子的。映入眼帘的却是Row，Column，这些是什么鬼？其实不难发现类似Row，Column 这样的组件，他们的基类都是Flex。
- Flexible

### Stack
- Positioned: left top 来决定位置
- NO Positioned: 通过控制Stack的alignment属性来控制对齐方式

### Visibility
Flutter Widge 并不支持 类似于 Android的 Visibility 属性
- 删除法
- Offstage: offstage属性设置为true
- 透明度

## 生命周期
widget是immutable的，发生变化的时候需要重建，所以谈不上状态。StatefulWidget 中的状态保持其实是通过State类来实现的。State拥有一套自己的生命周期，下面做一个简单的介绍。
![lifecycle](http://img.1991th.com/tuchongeter/tech/widget.state.lifecycle)
![lifecycle](http://img.1991th.com/tuchongeter/tech/flutter.lifecycle)

## App生命周期
![lifecycle](http://img.1991th.com/tuchongeter/tech/flutter.app.lifecycle)
