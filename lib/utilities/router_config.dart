import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/features/aiSummary/presentation/pages/ai_summary_screen.dart';
import 'package:roomly/features/boarding/presentation/pages/boarding_screen.dart';
import 'package:roomly/features/chat/presentation/pages/chat_screen.dart';
import 'package:roomly/features/codeVerification/presentation/pages/code_header.dart';
import 'package:roomly/features/createChat/presentation/pages/create_room_screen.dart';
import 'package:roomly/features/groups/presentation/pages/groups_screen.dart';
import 'package:roomly/features/home/presentation/pages/home_screen.dart';
import 'package:roomly/features/login/presentation/cubit/login_cubit.dart';
import 'package:roomly/features/login/presentation/pages/login_screen.dart';
import 'package:roomly/features/notifications/presentation/pages/notification_screen.dart';
import 'package:roomly/features/profile/presentation/pages/profile_screen.dart';
import 'package:roomly/features/profileSetup/presentation/pages/profile_setup_screen.dart';
import 'package:roomly/features/settings/presentation/pages/settings_screen.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/utilities/git_it.dart';
import 'package:roomly/widgets/mainLayout/main_layout_widget.dart';
import 'package:universal_html/html.dart' as html;

BuildContext? get CURRENT_CONTEXT =>
    GoRouterConfig.router.routerDelegate.navigatorKey.currentContext;

class GoRouterConfig {
  static String getServerUrl() {
    String completeUrl = html.window.location.href;
    Uri uri = Uri.parse(completeUrl);
    String serverUrl =
        '${uri.scheme}://${uri.host}${uri.hasPort ? ":${uri.port}" : ""}';
    print("com :$completeUrl");
    return serverUrl;
  }

  static void popUntilPath(String pattern) {
    final RouteMatch lastMatch =
        _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    final router = GoRouter.of(CURRENT_CONTEXT!);

    while (location.contains(pattern)) {
      if (!router.canPop()) return;
      router.pop();
    }
  }

  static Future popAllFromBrowser() async {
    while (
        html.window.location.href.replaceAll(getServerUrl(), "").length > 2) {
      html.window.history.back();
      await Future.delayed(Duration.zero);
    }
  }

  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: BoardingScreen.routeName,
        path: BoardingScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const BoardingScreen(),
          );
        },
      ),
      GoRoute(
          path: "/${LoginScreen.routeName}",
          name: LoginScreen.routeName,
          pageBuilder: (_, GoRouterState state) {
            return getCustomTransitionPage(
              state: state,
              child: BlocProvider<LoginCubit>(
                  create: (c) => sl<LoginCubit>(),
                  // dispse: (c, cubit) => cubit.close(),
                  child: const LoginScreen()),
            );
          },
          routes: [
            GoRoute(
                path: CodeScreen.routeName,
                name: CodeScreen.routeName,
                pageBuilder: (_, GoRouterState state) {
                  return getCustomTransitionPage(
                    state: state,
                    child: const CodeScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: ProfileSetupScreen.routeName,
                    name: ProfileSetupScreen.routeName,
                    pageBuilder: (_, GoRouterState state) {
                      return getCustomTransitionPage(
                        state: state,
                        child: const ProfileSetupScreen(),
                      );
                    },
                  ),
                ]),
          ]),
      ShellRoute(
          builder: (context, state, child) {
            return MainLayoutWidget(
              currentPath: state.fullPath,
              child: child,
            );
          },
          routes: [
            GoRoute(
              name: HomeScreen.routeName,
              path: "/${HomeScreen.routeName}",
              pageBuilder: (_, GoRouterState state) {
                return getCustomTransitionPage(
                  state: state,
                  child: const HomeScreen(),
                );
              },
            ),
            GoRoute(
              name: GroupsScreen.routeName,
              path: "/${GroupsScreen.routeName}",
              pageBuilder: (_, GoRouterState state) {
                return getCustomTransitionPage(
                  state: state,
                  child: const GroupsScreen(),
                );
              },
            ),
            GoRoute(
                name: ChatScreen.routeName,
                path: "/${ChatScreen.routeName}",
                pageBuilder: (_, GoRouterState state) {
                  return getCustomTransitionPage(
                    state: state,
                    child: const ChatScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    name: AiSummaryScreen.routeName,
                    path: AiSummaryScreen.routeName,
                    pageBuilder: (_, GoRouterState state) {
                      return getCustomTransitionPage(
                        state: state,
                        child: const AiSummaryScreen(),
                      );
                    },
                  )
                ]),
            GoRoute(
              name: NotificationScreen.routeName,
              path: "/${NotificationScreen.routeName}",
              pageBuilder: (_, GoRouterState state) {
                return getCustomTransitionPage(
                  state: state,
                  child: const NotificationScreen(),
                );
              },
            ),
            GoRoute(
              name: ProfileScreen.routeName,
              path: "/${ProfileScreen.routeName}",
              pageBuilder: (_, GoRouterState state) {
                return getCustomTransitionPage(
                  state: state,
                  child: const ProfileScreen(),
                );
              },
            ),
            GoRoute(
              name: SettingsScreen.routeName,
              path: "/${SettingsScreen.routeName}",
              pageBuilder: (_, GoRouterState state) {
                return getCustomTransitionPage(
                  state: state,
                  child: const SettingsScreen(),
                );
              },
            ),
            GoRoute(
              name: CreateChatScreen.routeName,
              path: "/${CreateChatScreen.routeName}",
              pageBuilder: (_, GoRouterState state) {
                return getCustomTransitionPage(
                  state: state,
                  child: const CreateChatScreen(),
                );
              },
            ),
          ]),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      return null;
    },
  );

  static CustomTransitionPage getCustomTransitionPage(
      {required GoRouterState state, required Widget child}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,

      /// i hava chaged this form 300 to 0
      transitionDuration: const Duration(milliseconds: 0),
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}

List<String> preventedRoutes = [
  ScreenRoutes.chat.name,
  ScreenRoutes.aiSummary.name
];
