import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shino/dashboard/panels/system/processes.dart';

import '../settings.dart';
import 'panels/system/cpu.dart';
import 'panels/system/disks.dart';
import 'panels/system/info.dart';
import 'panels/system/memory.dart';
import 'panels/system/networks.dart';
import 'panels/system/users.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const panelMargin = EdgeInsets.all(12);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shino"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(context, SettingsPage.route()),
          ),
        ],
      ),
      // extendBodyBehindAppBar: true,
      body: Theme(
        data: Theme.of(context).copyWith(
          cardTheme: Theme.of(context).cardTheme.copyWith(
                margin: panelMargin,
              ),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          final topPadding = MediaQuery.of(context).padding.top;

          final maxWidth = constraints.maxWidth - panelMargin.horizontal;
          final maxHeight =
              constraints.maxHeight - panelMargin.vertical - topPadding;

          final gridWidth = maxWidth / 9;
          final gridHeight = maxHeight / 8;

          Widget randomPanel(String key) {
            final panels = [
              (key) => SystemInfoPanel(key: key),
              (key) => SystemMemoryPanel(key: key),
              (key) => SystemCpuPanel(key: key),
            ];

            final panel = panels[Random().nextInt(panels.length)];
            return panel(Key(key));
          }

          final panels = [
            {
              "x": 0,
              "y": 0,
              "width": 3,
              "height": 2,
              "key": "0",
              "panel": randomPanel,
            },
            for (final n in [3, 6])
              {
                "x": n,
                "y": 0,
                "width": 3,
                "height": 2,
                "key": "1$n",
                "panel": randomPanel,
              },
            for (final n in [2, 4, 6, 8, 10, 12, 14, 16])
              {
                "x": 0,
                "y": n,
                "width": 2,
                "height": 2,
                "key": "10$n",
                "panel": randomPanel,
              },
            {
              "x": 2,
              "y": 2,
              "width": 2,
              "height": 4,
              "key": "200",
              "panel": (key) => SystemUsersPanel(key: Key(key)),
            },
            {
              "x": 2,
              "y": 6,
              "width": 2,
              "height": 2,
              "key": "201",
              "panel": (key) => SystemDisksPanel(key: Key(key)),
            },
            {
              "x": 4,
              "y": 2,
              "width": 2,
              "height": 6,
              "key": "202",
              "panel": (key) => SystemNetworksPanel(key: Key(key)),
            },
            {
              "x": 6,
              "y": 2,
              "width": 3,
              "height": 6,
              "key": "203",
              "panel": (key) => SystemProcessesPanel(key: Key(key)),
            },
          ];

          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: topPadding),
                child: SizedBox(
                  height: maxHeight * 3 + panelMargin.vertical,
                  child: Padding(
                    padding: panelMargin,
                    child: Stack(
                      children: [
                        for (final item in panels)
                          Positioned(
                            left: gridWidth * (item["x"]! as num),
                            top: gridHeight * (item["y"]! as num),
                            width: gridWidth * (item["width"]! as num),
                            height: gridHeight * (item["height"]! as num),
                            child: (item["panel"]! as Widget Function(
                                String))(item["key"] as String),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
