// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/pages/offical/icons.dart';
import 'package:fluttercn/pages/offical/material/material.dart';

class GalleryDemoCategory {
  const GalleryDemoCategory._({
    @required this.name,
    @required this.icon,
  });

  final String name;
  final IconData icon;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final GalleryDemoCategory typedOther = other;
    return typedOther.name == name && typedOther.icon == icon;
  }

  @override
  int get hashCode => hashValues(name, icon);

  @override
  String toString() {
    return '$runtimeType($name)';
  }
}

const GalleryDemoCategory kMaterialComponents = GalleryDemoCategory._(
  name: 'Material',
  icon: GalleryIcons.category_mdc,
);

class GalleryDemo {
  const GalleryDemo({
    @required this.title,
    @required this.icon,
    this.subtitle,
    @required this.category,
    @required this.routeName,
    this.documentationUrl,
    @required this.buildRoute,
  })  : assert(title != null),
        assert(category != null),
        assert(routeName != null),
        assert(buildRoute != null);

  final String title;
  final IconData icon;
  final String subtitle;
  final GalleryDemoCategory category;
  final String routeName;
  final WidgetBuilder buildRoute;
  final String documentationUrl;

  @override
  String toString() {
    return '$runtimeType($title $routeName)';
  }
}

List<GalleryDemo> _buildGalleryDemos() {
  final List<GalleryDemo> galleryDemos = <GalleryDemo>[
    GalleryDemo(
      title: 'Bottom navigation',
      subtitle: 'Bottom navigation with cross-fading views',
      icon: GalleryIcons.bottom_navigation,
      category: kMaterialComponents,
      routeName: BottomNavigationDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/BottomNavigationBar-class.html',
      buildRoute: (BuildContext context) => BottomNavigationDemo(),
    ),
    GalleryDemo(
      title: 'Bottom sheet: Modal',
      subtitle: 'A dismissible bottom sheet',
      icon: GalleryIcons.bottom_sheets,
      category: kMaterialComponents,
      routeName: ModalBottomSheetDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/showModalBottomSheet.html',
      buildRoute: (BuildContext context) => ModalBottomSheetDemo(),
    ),
    GalleryDemo(
      title: 'Bottom sheet: Persistent',
      subtitle: 'A bottom sheet that sticks around',
      icon: GalleryIcons.bottom_sheet_persistent,
      category: kMaterialComponents,
      routeName: PersistentBottomSheetDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/ScaffoldState/showBottomSheet.html',
      buildRoute: (BuildContext context) => PersistentBottomSheetDemo(),
    ),
    GalleryDemo(
      title: 'Buttons',
      subtitle: 'Flat, raised, dropdown, and more',
      icon: GalleryIcons.generic_buttons,
      category: kMaterialComponents,
      routeName: ButtonsDemo.routeName,
      buildRoute: (BuildContext context) => ButtonsDemo(),
    ),
    GalleryDemo(
      title: 'Buttons: Floating Action Button',
      subtitle: 'FAB with transitions',
      icon: GalleryIcons.buttons,
      category: kMaterialComponents,
      routeName: TabsFabDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/FloatingActionButton-class.html',
      buildRoute: (BuildContext context) => TabsFabDemo(),
    ),
    GalleryDemo(
      title: 'Cards',
      subtitle: 'Baseline cards with rounded corners',
      icon: GalleryIcons.cards,
      category: kMaterialComponents,
      routeName: CardsDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/Card-class.html',
      buildRoute: (BuildContext context) => CardsDemo(),
    ),
    GalleryDemo(
      title: 'Chips',
      subtitle: 'Labeled with delete buttons and avatars',
      icon: GalleryIcons.chips,
      category: kMaterialComponents,
      routeName: ChipDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/Chip-class.html',
      buildRoute: (BuildContext context) => ChipDemo(),
    ),
    GalleryDemo(
      title: 'Data tables',
      subtitle: 'Rows and columns',
      icon: GalleryIcons.data_table,
      category: kMaterialComponents,
      routeName: DataTableDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/PaginatedDataTable-class.html',
      buildRoute: (BuildContext context) => DataTableDemo(),
    ),
    GalleryDemo(
      title: 'Dialogs',
      subtitle: 'Simple, alert, and fullscreen',
      icon: GalleryIcons.dialogs,
      category: kMaterialComponents,
      routeName: DialogDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/showDialog.html',
      buildRoute: (BuildContext context) => DialogDemo(),
    ),
    GalleryDemo(
      title: 'Elevations',
      subtitle: 'Shadow values on cards',
      // TODO(larche): Change to custom icon for elevations when one exists.
      icon: GalleryIcons.cupertino_progress,
      category: kMaterialComponents,
      routeName: ElevationDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/Material/elevation.html',
      buildRoute: (BuildContext context) => ElevationDemo(),
    ),
    GalleryDemo(
      title: 'Expand/collapse list control',
      subtitle: 'A list with one sub-list level',
      icon: GalleryIcons.expand_all,
      category: kMaterialComponents,
      routeName: ExpansionTileListDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/ExpansionTile-class.html',
      buildRoute: (BuildContext context) => ExpansionTileListDemo(),
    ),
    GalleryDemo(
      title: 'Expansion panels',
      subtitle: 'List of expanding panels',
      icon: GalleryIcons.expand_all,
      category: kMaterialComponents,
      routeName: ExpansionPanelsDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/ExpansionPanel-class.html',
      buildRoute: (BuildContext context) => ExpansionPanelsDemo(),
    ),
    GalleryDemo(
      title: 'Grid',
      subtitle: 'Row and column layout',
      icon: GalleryIcons.grid_on,
      category: kMaterialComponents,
      routeName: GridListDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/widgets/GridView-class.html',
      buildRoute: (BuildContext context) => const GridListDemo(),
    ),
    GalleryDemo(
      title: 'Icons',
      subtitle: 'Enabled and disabled icons with opacity',
      icon: GalleryIcons.sentiment_very_satisfied,
      category: kMaterialComponents,
      routeName: IconsDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/IconButton-class.html',
      buildRoute: (BuildContext context) => IconsDemo(),
    ),
    GalleryDemo(
      title: 'Lists',
      subtitle: 'Scrolling list layouts',
      icon: GalleryIcons.list_alt,
      category: kMaterialComponents,
      routeName: ListDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/ListTile-class.html',
      buildRoute: (BuildContext context) => const ListDemo(),
    ),
    GalleryDemo(
      title: 'Lists: leave-behind list items',
      subtitle: 'List items with hidden actions',
      icon: GalleryIcons.lists_leave_behind,
      category: kMaterialComponents,
      routeName: LeaveBehindDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/widgets/Dismissible-class.html',
      buildRoute: (BuildContext context) => const LeaveBehindDemo(),
    ),
    GalleryDemo(
      title: 'Lists: reorderable',
      subtitle: 'Reorderable lists',
      icon: GalleryIcons.list_alt,
      category: kMaterialComponents,
      routeName: ReorderableListDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/ReorderableListView-class.html',
      buildRoute: (BuildContext context) => const ReorderableListDemo(),
    ),
    GalleryDemo(
      title: 'Menus',
      subtitle: 'Menu buttons and simple menus',
      icon: GalleryIcons.more_vert,
      category: kMaterialComponents,
      routeName: MenuDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/PopupMenuButton-class.html',
      buildRoute: (BuildContext context) => const MenuDemo(),
    ),
    GalleryDemo(
      title: 'Navigation drawer',
      subtitle: 'Navigation drawer with standard header',
      icon: GalleryIcons.menu,
      category: kMaterialComponents,
      routeName: DrawerDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/Drawer-class.html',
      buildRoute: (BuildContext context) => DrawerDemo(),
    ),
    GalleryDemo(
      title: 'Pagination',
      subtitle: 'PageView with indicator',
      icon: GalleryIcons.page_control,
      category: kMaterialComponents,
      routeName: PageSelectorDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/TabBarView-class.html',
      buildRoute: (BuildContext context) => PageSelectorDemo(),
    ),
    GalleryDemo(
      title: 'Pickers',
      subtitle: 'Date and time selection widgets',
      icon: GalleryIcons.event,
      category: kMaterialComponents,
      routeName: DateAndTimePickerDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/showDatePicker.html',
      buildRoute: (BuildContext context) => DateAndTimePickerDemo(),
    ),
    GalleryDemo(
      title: 'Progress indicators',
      subtitle: 'Linear, circular, indeterminate',
      icon: GalleryIcons.progress_activity,
      category: kMaterialComponents,
      routeName: ProgressIndicatorDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/LinearProgressIndicator-class.html',
      buildRoute: (BuildContext context) => ProgressIndicatorDemo(),
    ),
    GalleryDemo(
      title: 'Pull to refresh',
      subtitle: 'Refresh indicators',
      icon: GalleryIcons.refresh,
      category: kMaterialComponents,
      routeName: OverscrollDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/RefreshIndicator-class.html',
      buildRoute: (BuildContext context) => const OverscrollDemo(),
    ),
    GalleryDemo(
      title: 'Search',
      subtitle: 'Expandable search',
      icon: Icons.search,
      category: kMaterialComponents,
      routeName: SearchDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/showSearch.html',
      buildRoute: (BuildContext context) => SearchDemo(),
    ),
    GalleryDemo(
      title: 'Selection controls',
      subtitle: 'Checkboxes, radio buttons, and switches',
      icon: GalleryIcons.check_box,
      category: kMaterialComponents,
      routeName: SelectionControlsDemo.routeName,
      buildRoute: (BuildContext context) => SelectionControlsDemo(),
    ),
    GalleryDemo(
      title: 'Sliders',
      subtitle: 'Widgets for selecting a value by swiping',
      icon: GalleryIcons.sliders,
      category: kMaterialComponents,
      routeName: SliderDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/Slider-class.html',
      buildRoute: (BuildContext context) => SliderDemo(),
    ),
    GalleryDemo(
      title: 'Snackbar',
      subtitle: 'Temporary messaging',
      icon: GalleryIcons.snackbar,
      category: kMaterialComponents,
      routeName: SnackBarDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/ScaffoldState/showSnackBar.html',
      buildRoute: (BuildContext context) => const SnackBarDemo(),
    ),
    GalleryDemo(
      title: 'Tabs',
      subtitle: 'Tabs with independently scrollable views',
      icon: GalleryIcons.tabs,
      category: kMaterialComponents,
      routeName: TabsDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/TabBarView-class.html',
      buildRoute: (BuildContext context) => TabsDemo(),
    ),
    GalleryDemo(
      title: 'Tabs: Scrolling',
      subtitle: 'Tab bar that scrolls',
      category: kMaterialComponents,
      icon: GalleryIcons.tabs,
      routeName: ScrollableTabsDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/TabBar-class.html',
      buildRoute: (BuildContext context) => ScrollableTabsDemo(),
    ),
    GalleryDemo(
      title: 'Text fields',
      subtitle: 'Single line of editable text and numbers',
      icon: GalleryIcons.text_fields_alt,
      category: kMaterialComponents,
      routeName: TextFormFieldDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/TextFormField-class.html',
      buildRoute: (BuildContext context) => const TextFormFieldDemo(),
    ),
    GalleryDemo(
      title: 'Tooltips',
      subtitle: 'Short message displayed on long-press',
      icon: GalleryIcons.tooltip,
      category: kMaterialComponents,
      routeName: TooltipDemo.routeName,
      documentationUrl:
          'https://docs.flutter.io/flutter/material/Tooltip-class.html',
      buildRoute: (BuildContext context) => TooltipDemo(),
    ),
  ];

  // Keep Pesto around for its regression test value. It is not include

  return galleryDemos;
}

final List<GalleryDemo> kAllGalleryDemos = _buildGalleryDemos();

final Set<GalleryDemoCategory> kAllGalleryDemoCategories = kAllGalleryDemos
    .map<GalleryDemoCategory>((GalleryDemo demo) => demo.category)
    .toSet();

final Map<GalleryDemoCategory, List<GalleryDemo>> kGalleryCategoryToDemos =
    Map<GalleryDemoCategory, List<GalleryDemo>>.fromIterable(
  kAllGalleryDemoCategories,
  value: (dynamic category) {
    return kAllGalleryDemos
        .where((GalleryDemo demo) => demo.category == category)
        .toList();
  },
);

final Map<String, String> kDemoDocumentationUrl =
    Map<String, String>.fromIterable(
  kAllGalleryDemos.where((GalleryDemo demo) => demo.documentationUrl != null),
  key: (dynamic demo) => demo.routeName,
  value: (dynamic demo) => demo.documentationUrl,
);

const Color _kFlutterBlue = Color(0xFF003D75);
const double _kDemoItemHeight = 64.0;

class _DemoItem extends StatelessWidget {
  const _DemoItem({Key key, this.demo}) : super(key: key);

  final GalleryDemo demo;

  void _launchDemo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: demo.buildRoute));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final double textScaleFactor = MediaQuery.textScaleFactorOf(context);
    return RawMaterialButton(
      padding: EdgeInsets.zero,
      splashColor: theme.primaryColor.withOpacity(0.12),
      highlightColor: Colors.transparent,
      onPressed: () {
        _launchDemo(context);
      },
      child: Container(
        constraints:
            BoxConstraints(minHeight: _kDemoItemHeight * textScaleFactor),
        child: Row(
          children: <Widget>[
            Container(
              width: 56.0,
              height: 56.0,
              alignment: Alignment.center,
              child: Icon(
                demo.icon,
                size: 24.0,
                color: isDark ? Colors.white : _kFlutterBlue,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    demo.title,
                    style: theme.textTheme.subhead.copyWith(
                      color: isDark ? Colors.white : const Color(0xFF202124),
                    ),
                  ),
                  if (demo.subtitle != null)
                    Text(
                      demo.subtitle,
                      style: theme.textTheme.body1.copyWith(
                          color:
                              isDark ? Colors.white : const Color(0xFF60646B)),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 44.0),
          ],
        ),
      ),
    );
  }
}

class DemosPage extends StatelessWidget {
  const DemosPage(this.category);

  final GalleryDemoCategory category;

  @override
  Widget build(BuildContext context) {
    // When overriding ListView.padding, it is necessary to manually handle
    // safe areas.
    final double windowBottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      appBar: AppBar(
        title: Text("Material"),
      ),
      body: KeyedSubtree(
        key: const ValueKey<String>('GalleryDemoList'),
        // So the tests can find this ListView
        child: Semantics(
          scopesRoute: true,
          namesRoute: true,
          label: category.name,
          explicitChildNodes: true,
          child: ListView(
            dragStartBehavior: DragStartBehavior.down,
            key: PageStorageKey<String>(category.name),
            padding: EdgeInsets.only(top: 8.0, bottom: windowBottomPadding),
            children: kGalleryCategoryToDemos[category]
                .map<Widget>((GalleryDemo demo) {
              return _DemoItem(demo: demo);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
