/*
 * Copyright (C) Roman Rikhter <teledurak@gmail.com>, 2024
 * This program comes with ABSOLUTELY NO WARRANTY;
 * This is free software, and you are welcome to redistribute it under certain conditions;
 *
 * See /LICENSE for more details.
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handygram/src/common/cubits/colors.dart';
import 'package:handygram/src/common/cubits/current_account.dart';
import 'package:handygram/src/common/cubits/text.dart';
import 'package:handygram/src/common/native/channel.dart';
import 'package:handygram/src/common/settings/manager.dart';
import 'package:handygram/src/components/controls/tile_button.dart';
import 'package:handygram/src/components/icons/svg.dart';
import 'package:handygram/src/components/list/scrollbar.dart';
import 'package:handygram/src/components/list/scrollwrapper.dart';
import 'package:handygram/src/components/scaled_sizes.dart';
import 'package:handygram/src/components/text/header.dart';
import 'package:handygram/src/pages/home/settings/user.dart';

class SettingsMain extends StatefulWidget {
  const SettingsMain({super.key});

  @override
  State<SettingsMain> createState() => _SettingsMainState();
}

class _SettingsMainState extends State<SettingsMain>
    with AutomaticKeepAliveClientMixin<SettingsMain> {
  final _controller = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final router = GoRouter.of(context);
    return Scaffold(
      body: HandyScrollWrapper(
        controller: _controller,
        child: HandyScrollbar(
          controller: _controller,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: Paddings.tilesHorizontalPadding,
            ),
            controller: _controller,
            children: [
              const PageHeader(title: "Settings"),
              SettingsUserButton(
                userId: null,
                onTap: () => GoRouter.of(context).push("/settings/account"),
              ),
              SizedBox(height: Paddings.betweenSimilarElements),
              TileButton(
                icon: const SvgIcon("theme"),
                text: "Interface",
                style: TileButtonStyles.basic,
                onTap: () => router.push("/settings/interface"),
              ),
              SizedBox(height: Paddings.betweenSimilarElements),
              TileButton(
                icon: const SvgIcon("chat"),
                text: "Messaging",
                style: TileButtonStyles.basic,
                onTap: () => router.push("/settings/chat"),
              ),
              SizedBox(height: Paddings.betweenSimilarElements),
              TileButton(
                icon: const SvgIcon("notification"),
                text: "Notifications",
                style: TileButtonStyles.basic,
                onTap: () => router.push("/settings/notifications"),
              ),
              SizedBox(height: Paddings.betweenSimilarElements),
              TileButton(
                icon: const SvgIcon("storage"),
                text: "Storage",
                style: TileButtonStyles.basic,
                onTap: () => router.push("/settings/storage"),
              ),
              SizedBox(height: Paddings.betweenSimilarElements),
              TileButton(
                icon: const SvgIcon("proxy"),
                text: "Proxy",
                style: TileButtonStyles.basic,
                onTap: () => router.push("/proxy_list"),
              ),
              SizedBox(height: Paddings.betweenSimilarElements),
              TileButton(
                icon: const SvgIcon("info"),
                text: "About app",
                style: TileButtonStyles.basic,
                onTap: () => router.push("/settings/about"),
              ),
              SizedBox(height: Paddings.beforeSmallButton),
              Text(
                "HandyGram ${Settings().currentVersion} (${Settings().currentCodename})",
                style: TextStyles.active.bodyMedium!.copyWith(
                  color: ColorStyles.active.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Paddings.betweenSimilarElements),
              Text(
                "${HandyNatives().gitInfo.$1}@${HandyNatives().gitInfo.$2.substring(0, 7)}",
                style: TextStyles.active.bodyMedium!.copyWith(
                  color: ColorStyles.active.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Paddings.betweenSimilarElements),
              FutureBuilder(
                future: CurrentAccount.providers.options.get("version"),
                builder: (context, sn) => Text(
                  "TDLib ${sn.data ?? "unknown"}",
                  style: TextStyles.active.bodyMedium!.copyWith(
                    color: ColorStyles.active.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Paddings.afterPageEndingWithSmallButton),
            ],
          ),
        ),
      ),
    );
  }
}
