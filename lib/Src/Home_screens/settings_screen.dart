import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../Constants/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;
  bool locationServices = true;
  bool autoSaveData = true;
  bool backgroundAppRefresh = true;
  bool appSounds = true;
  bool vibrationFeedback = true;
  bool showAppUpdates = true;
  bool privacyMode = false;
  bool languagePreference = false;


  void _toggleSetting(String setting, bool value) {
    setState(() {
      switch (setting) {
        case 'darkMode':
          isDarkMode = value;
          break;
        case 'notifications':
          notificationsEnabled = value;
          break;
        case 'location':
          locationServices = value;
          break;
        case 'autoSave':
          autoSaveData = value;
          break;
        case 'backgroundRefresh':
          backgroundAppRefresh = value;
          break;
        case 'appSounds':
          appSounds = value;
          break;
        case 'vibration':
          vibrationFeedback = value;
          break;
        case 'showUpdates':
          showAppUpdates = value;
          break;
        case 'privacyMode':
          privacyMode = value;
          break;
        case 'language':
          languagePreference = value;
          break;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkModeLocal = brightness == Brightness.dark;


    return Scaffold(
      backgroundColor: isDarkModeLocal ? secondaryColor : primaryColor,
      appBar: AppBar(
        title: Text("Settings", style: Theme.of(context).textTheme.headlineMedium),
        backgroundColor: isDarkModeLocal ? secondaryColor : primaryColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left_solid),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30, top: 10,right: 10,left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Dark Mode Switch
              _buildSettingSwitch('Dark Mode', 'darkMode', isDarkMode),
              Divider(),

              // Notifications Switch
              _buildSettingSwitch('Enable Notifications', 'notifications', notificationsEnabled),
              Divider(),

              // Location Services Switch
              _buildSettingSwitch('Location Services', 'location', locationServices),
              Divider(),

              // Auto-Save Data Switch
              _buildSettingSwitch('Auto Save Data', 'autoSave', autoSaveData),
              Divider(),

              // Background App Refresh Switch
              _buildSettingSwitch('Background App Refresh', 'backgroundRefresh', backgroundAppRefresh),
              Divider(),

              // App Sounds Switch
              _buildSettingSwitch('App Sounds', 'appSounds', appSounds),
              Divider(),

              // Vibration Feedback Switch
              _buildSettingSwitch('Vibration Feedback', 'vibration', vibrationFeedback),
              Divider(),

              // Show App Updates Switch
              _buildSettingSwitch('Show App Updates', 'showUpdates', showAppUpdates),
              Divider(),

              // Privacy Mode Switch
              _buildSettingSwitch('Privacy Mode', 'privacyMode', privacyMode),
              Divider(),

              // Language Preference Switch
              _buildSettingSwitch('Other Language', 'language', languagePreference),
              Divider(),

              // Log Out Option (no switch)
              _buildLogOutOption(isDarkModeLocal),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildSettingSwitch(String title, String setting, bool value) {
    return Material(
      color: value ? secondaryColor : containerBg,
      elevation: 10.0,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: value ? secondaryColor : containerBg,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: value ? primaryColor : secondaryColor,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: value ? Colors.white : Colors.black,
              ),
            ),
            Switch(
              value: value,
              onChanged: (newValue) {
                _toggleSetting(setting, newValue);
              },
              activeColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for the Log Out option (non-switch)
  Widget _buildLogOutOption(bool isDarkModeLocal) {
    return Material(
      color: isDarkModeLocal ? secondaryColor : containerBg,
      elevation: 10.0,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDarkModeLocal ? secondaryColor : containerBg,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: isDarkModeLocal ? primaryColor : secondaryColor,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Log Out',
              style: TextStyle(
                fontSize: 18,
                color: isDarkModeLocal ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
              icon: Icon(
                LineAwesomeIcons.sign_out_alt_solid,
                color: isDarkModeLocal ? Colors.white : Colors.black,
              ),
              onPressed: () {
                // Implement your log out logic here
                log("Logging out...");
              },
            ),
          ],
        ),
      ),
    );
  }
}
