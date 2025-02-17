import 'package:flutter/material.dart';
import 'package:foodcommerce/constants.dart';
import 'package:foodcommerce/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Appcolors.mainColor),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Appcolors.mainBlackColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Appcolors.mainColor, size: 16),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.mainColor,
        title: const BigText(
          text: "Profile",
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Handle edit profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Appcolors.mainColor,
                        width: 2,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BigText(text: "John Doe"),
                      const SizedBox(height: 5),
                      SmallText(
                        text: "john.doe@example.com",
                        color: Appcolors.paraColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Stats
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat("Orders", "28"),
                  _buildStat("Pending", "3"),
                  _buildStat("Points", "2850"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Options
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildProfileOption(
                    Icons.location_on_outlined,
                    "Delivery Address",
                    () {},
                  ),
                  _buildProfileOption(
                    Icons.payment_outlined,
                    "Payment Methods",
                    () {},
                  ),
                  _buildProfileOption(
                    Icons.notifications_outlined,
                    "Notifications",
                    () {},
                  ),
                  _buildProfileOption(
                    Icons.security_outlined,
                    "Security",
                    () {},
                  ),
                  _buildProfileOption(
                    Icons.language_outlined,
                    "Language",
                    () {},
                  ),
                  _buildProfileOption(
                    Icons.help_outline,
                    "Help Center",
                    () {},
                  ),
                  _buildProfileOption(
                    Icons.logout,
                    "Logout",
                    () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Appcolors.buttonBackgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          BigText(
            text: value,
            color: Appcolors.mainColor,
          ),
          const SizedBox(height: 5),
          SmallText(
            text: title,
            color: Appcolors.paraColor,
          ),
        ],
      ),
    );
  }
}
