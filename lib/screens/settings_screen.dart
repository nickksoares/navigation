import 'package:flutter/material.dart';
import 'package:navigation/components/main_drawer.dart';
import 'package:navigation/models/settings.dart';
import 'package:navigation/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChange;
  const SettingsScreen(this.settings, this.onSettingsChange, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool)? onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged!(value);
        widget.onSettingsChange(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Settings'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _createSwitch(
                'Gluten Free',
                'Only shows meals without gluten',
                settings.isGlutenFree,
                (value) => setState(
                  () => settings.isGlutenFree = value,
                ),
              ),
              _createSwitch(
                'Lactose Free',
                'Only shows meals without lactose',
                settings.isLactoseFree,
                (value) => setState(
                  () => settings.isLactoseFree = value,
                ),
              ),
              _createSwitch(
                'Vegan Only',
                'Only shows meals that are vegan',
                settings.isVegan,
                (value) => setState(
                  () => settings.isVegan = value,
                ),
              ),
              _createSwitch(
                'Vegetarian only',
                'Only shows meals that are vegetarian',
                settings.isVegetarian,
                (value) => setState(
                  () => settings.isVegetarian = value,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
