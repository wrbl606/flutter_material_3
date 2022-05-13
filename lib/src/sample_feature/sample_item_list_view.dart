import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_3/src/settings/settings_controller.dart';

import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatefulWidget {
  final SettingsController _settingsController;

  const SampleItemListView({
    super.key,
    required SettingsController settingsController,
  }) : _settingsController = settingsController;

  static const routeName = '/';

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  int currentPageIndex = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Material 3 ${widget._settingsController.useMaterial3 ? 'enabled' : 'disabled'}'),
        actions: [
          AnimatedBuilder(
            animation: widget._settingsController,
            builder: (context, child) => IconButton(
              onPressed: () => widget._settingsController
                  .updateUseMaterial3(!widget._settingsController.useMaterial3),
              icon: Text(
                widget._settingsController.useMaterial3 ? 'M2' : 'M3',
              ),
            ),
          ),
          AnimatedBuilder(
            animation: widget._settingsController,
            builder: (context, child) => IconButton(
              onPressed: () async {
                widget._settingsController.updateColorSeed(
                    await showColorPickerDialog(
                        context, widget._settingsController.colorSeed));
              },
              icon: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget._settingsController.colorSeed,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          const VerticalDivider(
            width: 1,
            thickness: 1,
          ),
          Expanded(
            child: ListView(
              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after it
              // has been killed while running in the background.
              restorationId: 'sampleItemListView',
              padding: const EdgeInsets.all(12),
              children: [
                Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Theme.of(context).textTheme.displayLarge,
                        Theme.of(context).textTheme.displayMedium,
                        Theme.of(context).textTheme.displaySmall,
                        Theme.of(context).textTheme.titleLarge,
                        Theme.of(context).textTheme.titleMedium,
                        Theme.of(context).textTheme.titleSmall,
                        Theme.of(context).textTheme.bodyLarge,
                        Theme.of(context).textTheme.bodyMedium,
                        Theme.of(context).textTheme.bodySmall,
                        Theme.of(context).textTheme.labelLarge,
                        Theme.of(context).textTheme.labelMedium,
                        Theme.of(context).textTheme.labelSmall,
                      ]
                          .map<Widget>((style) => Text(
                                'Example text',
                                style: style,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Tap me'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.star_border_rounded),
                            label: Text('Tap me'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.star_outline_rounded),
                          ),
                          FloatingActionButton.extended(
                            onPressed: () {},
                            label: Text('Tap me'),
                          ),
                          FloatingActionButton.extended(
                            onPressed: () {},
                            icon: const Icon(Icons.star_outline_rounded),
                            label: Text('Tap me'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text('Tap me'),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.star_outline_rounded),
                            label: Text('Tap me'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: Text('Tap me'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.star_outline_rounded),
                            label: Text('Tap me'),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Commute',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
        ],
      ),
    );
  }
}
