import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class SRalamaScreen extends StatefulWidget {
  const SRalamaScreen({super.key});

  @override
  State<SRalamaScreen> createState() => _SRalamaScreenState();
}

class _SRalamaScreenState extends State<SRalamaScreen> {
  bool isTeamSelected = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;
    final customTypography = theme.extension<CustomTypography>()!;

    return Scaffold(
      backgroundColor: customColors.backgroundColorbgbase,
      body: SafeArea(
        child: Column(
          children: [
            _buildStatusBar(),
            _buildAppBar(customColors, customTypography),
            _buildTabBar(customColors, customTypography),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildDropdownButton(customColors, customTypography),
                    SizedBox(height: 16),
                    _buildLeaderboard(customColors, customTypography),
                    SizedBox(height: 16),
                    _buildRankingList(customColors, customTypography),
                    SizedBox(height: 16),
                    _buildViewAllButton(customColors, customTypography),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '08:15',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.black),
              SizedBox(width: 5),
              Icon(Icons.wifi, size: 16, color: Colors.black),
              SizedBox(width: 5),
              Icon(Icons.battery_full, size: 16, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(
    CustomColors customColors,
    CustomTypography customTypography,
  ) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: customColors.backgroundColorbgbase,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back, color: customColors.iconColoriconsecondary),
          Text(
            'Sıralama',
            style: customTypography.textMdMedium.copyWith(
              color: customColors.primaryColorprimarytext,
            ),
          ),
          Container(width: 24),
        ],
      ),
    );
  }

  Widget _buildTabBar(
    CustomColors customColors,
    CustomTypography customTypography,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => setState(() => isTeamSelected = true),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isTeamSelected
                    ? customColors.backgroundColorbgbase
                    : Colors.transparent,
                border: isTeamSelected
                    ? Border.all(color: customColors.borderColorbordersecondary)
                    : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Takımım',
                style: customTypography.textSmMedium.copyWith(
                  color: customColors.textColortextdescription,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => isTeamSelected = false),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: !isTeamSelected
                    ? customColors.backgroundColorbgbase
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Eğitim Planı',
                style: customTypography.textSmMedium.copyWith(
                  color: customColors.textColortext,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownButton(
    CustomColors customColors,
    CustomTypography customTypography,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: customColors.backgroundColorbgbase,
        border: Border.all(color: customColors.borderColorbordersecondary),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Müşteri Deneyim Programı',
            style: customTypography.textSmSemibold.copyWith(
              color: customColors.textColortext,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: customColors.textColortext),
        ],
      ),
    );
  }

  Widget _buildLeaderboard(
    CustomColors customColors,
    CustomTypography customTypography,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: customColors.backgroundColorbgcontainer,
        border: Border.all(color: customColors.borderColorbordersecondary),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildPodiumItem(
                rank: 3,
                name: 'Kübra P.',
                xp: '1051 XP',
                color: customColors.warningColorwarning,
                customColors: customColors,
                customTypography: customTypography,
              ),
              _buildPodiumItem(
                rank: 1,
                name: 'Gülnur A.',
                xp: '1323 XP',
                color: const Color(0xFFFFD700),
                customColors: customColors,
                customTypography: customTypography,
                isFirst: true,
              ),
              _buildPodiumItem(
                rank: 2,
                name: 'Ceyda B.',
                xp: '1149 XP',
                color: customColors.textColortextsecondary,
                customColors: customColors,
                customTypography: customTypography,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPodiumItem({
    required int rank,
    required String name,
    required String xp,
    required Color color,
    required CustomColors customColors,
    required CustomTypography customTypography,
    bool isFirst = false,
  }) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: isFirst ? 35 : 30,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.grey[600]),
            ),
            Positioned(
              bottom: -5,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: Text(
                  rank.toString(),
                  style: customTypography.textXsSemibold.copyWith(
                    color: customColors.backgroundColorbgbase,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: customTypography.textXsMedium.copyWith(
            color: customColors.textColortext,
          ),
        ),
        Text(
          xp,
          style: customTypography.textXsRegular.copyWith(
            color: customColors.textColortextsecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildRankingList(
    CustomColors customColors,
    CustomTypography customTypography,
  ) {
    final rankings = [
      {'rank': 4, 'name': 'Ayşe K.', 'xp': '499 XP', 'isUser': false},
      {'rank': 5, 'name': 'Mert B.', 'xp': '550 XP', 'isUser': false},
      {'rank': 6, 'name': 'Siz', 'xp': '350 XP', 'isUser': true},
      {'rank': 7, 'name': 'Özgür Ö.', 'xp': '290 XP', 'isUser': false},
      {'rank': 8, 'name': 'Mehmet D.', 'xp': '250 XP', 'isUser': false},
      {'rank': 9, 'name': 'Selin E.', 'xp': '210 XP', 'isUser': false},
      {'rank': 10, 'name': 'Hakan S.', 'xp': '195 XP', 'isUser': false},
    ];

    return Column(
      children: rankings
          .map(
            (item) => _buildRankingItem(
              rank: item['rank'] as int,
              name: item['name'] as String,
              xp: item['xp'] as String,
              isUser: item['isUser'] as bool,
              customColors: customColors,
              customTypography: customTypography,
            ),
          )
          .toList(),
    );
  }

  Widget _buildRankingItem({
    required int rank,
    required String name,
    required String xp,
    required bool isUser,
    required CustomColors customColors,
    required CustomTypography customTypography,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUser
            ? customColors.successColorsuccessbg
            : customColors.backgroundColorbgcontainer,
        border: Border.all(
          color: isUser
              ? customColors.successColorsuccessborder
              : customColors.borderColorbordersecondary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            child: Text(
              rank.toString(),
              style: customTypography.textXsMedium.copyWith(
                color: customColors.textColortext,
              ),
            ),
          ),
          SizedBox(width: 12),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 16, color: Colors.grey[600]),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: customTypography.textSmMedium.copyWith(
                color: customColors.textColortext,
              ),
            ),
          ),
          Text(
            xp,
            style: customTypography.textXsRegular.copyWith(
              color: customColors.textColortextsecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewAllButton(
    CustomColors customColors,
    CustomTypography customTypography,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: customColors.primaryColorprimary,
        border: Border.all(color: customColors.primaryColorprimary),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        'Tüm Listeyi Görüntüle',
        textAlign: TextAlign.center,
        style: customTypography.textSmSemibold.copyWith(
          color: customColors.textColortextlightsolid,
        ),
      ),
    );
  }
}

class Spacing {}
