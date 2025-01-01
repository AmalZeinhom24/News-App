import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news/screens/widgets/language_bottom_sheet.dart';
import 'package:news/screens/widgets/settings_items.dart';
import 'package:news/screens/widgets/settings_switch.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/settings_provider.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'settings';
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<MyProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.settings,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
              SizedBox(height: 40),
              Text(AppLocalizations.of(context)!.settings,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
              SizedBox(height: 20),
              SettingsItems(
                title: AppLocalizations.of(context)!.language,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                icon: Ionicons.earth,
                value: settings.currentLocal == 'en' ? 'English' : 'العربية',
                onTap: (){
                  showLanguageBottomSheet(context);
                },
              ),
              SizedBox(height: 20),
              SettingsItems(
                title: AppLocalizations.of(context)!.notifications,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                icon: Ionicons.notifications,
              ),
              SizedBox(height: 20),
              SettingsSwitch(
                title: AppLocalizations.of(context)!.dark,
                bgColor: Colors.purple.shade100,
                iconColor: Colors.purple,
                icon: (Icons.dark_mode),
                value: settings.isDarkMode,
                onTap: (value) {
                  settings.changeTheme(
                    value ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
              SizedBox(height: 20),
              SettingsItems(
                title: AppLocalizations.of(context)!.help,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                icon: Ionicons.nuclear,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
      builder: (context) => LanguageBottomSheet(),
    );
  }
}
