import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/user_model.dart';
import 'widgets/profile/profile_header.dart';
import 'widgets/profile/profile_card.dart';
import 'widgets/profile/certificate_tile.dart';
import 'widgets/profile/menu_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final data = await rootBundle.loadString('assets/data/dummy_user.json');
    final jsonResult = json.decode(data);
    setState(() {
      user = UserModel.fromJson(jsonResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            ProfileCard(user: user!),
            const SizedBox(height: 10),
            const CertificateTile(),
            const SizedBox(height: 10),
            const MenuTile(icon: Icons.edit, title: "Edit Profile"),
            const MenuTile(icon: Icons.settings, title: "Settings"),
            const MenuTile(icon: Icons.help_outline, title: "Help & Support"),
            const MenuTile(icon: Icons.info_outline, title: "About"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
