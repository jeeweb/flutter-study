import 'package:feel_log/features/authentication/repos/authentication_repository.dart';
import 'package:feel_log/router/router_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(64.0),
            ),
          ),
          child: ListView(
            children: [
              SwitchListTile.adaptive(
                value: false,
                onChanged: (value) => {},
                title: Text(
                  "Change Theme",
                ),
                subtitle: Text(
                  "Monotone theme / Color theme.",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              ListTile(
                title: const Text("Log out"),
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text("Are you sure?"),
                      actions: [
                        CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("No"),
                        ),
                        CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () {
                            ref.read(authRepo).logOut();
                            context.go(RouteURL.login);
                          },
                          child: const Text("Yes"),
                        )
                      ],
                    ),
                  );
                },
              ),
              AboutListTile(
                applicationVersion: "1.0",
                applicationLegalese: "It's still under construction.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
