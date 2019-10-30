# Widget

> Flutter 的核心设计思想便是: Everything is a Widget.

![widget](assets/img/widget.png)

Flutter 中，Widget 是不可变的，无法被直接更新，你需要操作 Widget 的状态。这就是有状态 (Stateful) 和无状态 (Stateless) Widget 概念的来源。StatelessWidget 如其字面意思—没有状态信息的 Widget。StatelessWidget 用于你描述的用户界面的一部分不依赖于除了对象中的配置信息以外的任何东西的场景。如果你想要根据 HTTP 请求返回的数据或者用户的交互来动态地更新界面，那么你就必须使用 StatefulWidget，并告诉 Flutter 框架 Widget 的状态 (State) 更新了，以便 Flutter 可以更新这个 Widget。

下面列出一些常用的Widget

## 高频控件
|控件|描述|备注|
|:--|:--|:--:|
|Card|一个 Material Design 卡片。拥有一个圆角和阴影.|-|
|Padding|一个widget, 会给其子widget添加指定的填充。|-|
|Center|将其子widget居中显示在自身内部的widget。|-|
|Align|一个widget，它可以将其子widget对齐，根据子widget的大小自动调整大小。|-|
|Text|单一格式的文本。|-|
|RichText|一个富文本Text，可以显示多种样式的text。|-|
|TextField|文本输入框。|-|
|Switch|On/off 用于切换一个单一状态。|-|
|Checkbox|复选框，允许用户从一组中选择多个选项。|-|
|Opacity|使其子widget透明的widget。|-|
|Divider&VerticalDivider|一个逻辑1像素厚的水平分割线，两边都有填充.|-|
|SizedBox|一个特定大小的盒子。这个widget强制它的孩子有一个特定的宽度和高度。|-|
|Offstage|一个布局widget，可以控制其子widget的显示和隐藏。|-|
|OverflowBox|对其子项施加不同约束的widget，它可能允许子项溢出父级。|-|
|FittedBox|按自己的大小调整其子widget的大小和位置。|-|
|ConstrainedBox|对其子项施加附加约束的widget。|-|
|AspectRatio|一个widget，试图将子widget的大小指定为某个特定的长宽比。|-|
|Baseline|根据子项的基线对它们的位置进行定位的widget。|-|
|IntrinsicHeight|一个widget，它将它的子widget的高度调整其本身实际的高度。|-|
|IntrinsicWidth|一个widget，它将它的子widget的宽度调整其本身实际的宽度。|-|
|ExpansionPanel|可收缩的Panel。|-|
|AlertDialog|一个会中断用户操作的对话款，需要用户确认。|-|
|BottomSheet|BottomSheet是一个从屏幕底部滑起的列表。|-|
|Date & Time Pickers|日期&时间选择器。|-|

## MaterialApp

## Scaffold
- AppBar
- FloatingActionButton

## Container
相当于 Android 中的 ViewGroup
- BoxDecoration 提供了对背景色，边框，圆角，阴影和渐变等功能的定制能力。
- BoxConstraints 其实是对 Container 组件大小的描述。

##  GestureDetector
在Flutter中手势识别也是一个widget！使用时只需要将GestureDetector包裹在目标widget外面，再实现对应事件的函数即可。

## DragTarget

## Flex
`Flex` 是 `Flexible Box` 的缩写，意为 **弹性布局**，用来为盒状模型提供最大的灵活性。[flex盒子模型](https://www.runoob.com/w3cnote/flex-grammar.html).`Flutter` 在布局上也提供了完整的 `Flex` 布局能力。在 `Flutter` 中，主要通过 `Row`,`Column`,`Flexible` 来实现 **弹性布局**。

<div align="center">

![flex](assets/img/flex.png)。

</div>

![column](assets/img/column.webp)

垂直布局时：y轴为主轴，x轴为副轴!

![row](assets/img/row.webp)

水平布局时：x轴为主轴，y轴为副轴!

## Stack
堆叠控件,相当于 `Android` 中的 `FrameLayout`

- Positioned: left top 来决定位置
- NO Positioned: 通过控制Stack的alignment属性来控制对齐方式

## Flow
## ListView
## GridView
## Table
## RefreshIndicator

## Image
1. Boxfit,相当于 Android 中的 ScaleType
  ![Boxfit](http://img.1991th.com/tuchongeter/tech/image.boxfit)
2. ImageProvider 支持不同情景下的图片加载
  ![Provider](http://img.1991th.com/tuchongeter/tech/image.provider)
3. 缓存
  ImageCache是ImageProvider默认使用的图片缓存。ImageCache使用的是LRU的算法。默认可以存储1000张图片。如果觉得缓存太大，可以通过设置ImageCache的maximumSize属性来控制缓存图片的数量。也可以通过设置maximumSizeBytes来控制缓存的大小（默认缓存大小10MB）。
4. 在实际开发中，考虑到图片加载速度可能不能达到预期。所以希望能增加渐入效果&增加placeHolder的功能。Flutter同样提供的这样的组件——FadeInImage。
5. 圆形头像 `CircleAvatar`, 圆角图片 `ClipRRect`
6. 多分辨率适配

![dimens-pic](assets/img/dimens-pic.png)

## ClipPath

## ClipRect

## CustomPaint

## FutureBuilder

## StreamBuilder

## 小结
1. Flutter Widge 并不支持 类似于 Android的 Visibility 属性,只能设置 `alpha` 或者 `Offstage` 或者通过 `State` 来删除

## 参考链接
- [widget英文文档](https://flutter.dev/docs/development/ui/widgets)
- [widget中文文档](https://flutterchina.club/widgets/)
- [flutter Widget 在线预览](https://flutter-widget-livebook.blankapp.org/basics/introduction/)
- [在线构建Widget](https://ui.flutterdart.cn/)
- [Android开发者Flutter指南](https://flutter.cn/docs/get-started/flutter-for/android-devs)
- [iOS开发者Flutter指南](https://flutter.cn/docs/get-started/flutter-for/ios-devs)
