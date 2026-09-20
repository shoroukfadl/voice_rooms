import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart' as html;
import 'package:voice_rooms/features/boarding/presentation/pages/boarding_screen.dart';
import 'package:voice_rooms/features/emailVerification/presentation/pages/email_verification_screen.dart';
import 'package:voice_rooms/features/forgotPassword/presentation/pages/forgot_password_screen.dart';
import 'package:voice_rooms/features/home/presentation/pages/home_screen.dart';
import 'package:voice_rooms/features/login/presentation/pages/login_screen.dart';
import 'package:voice_rooms/features/register/presentation/pages/register_screen.dart';
import 'package:voice_rooms/features/resetLink/presentation/pages/reset_link_screen.dart';
import 'package:voice_rooms/widgets/mainLayout/main_layout_widget.dart';

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
              child: const LoginScreen(),
            );
          },
          routes: [
            GoRoute(
                path: ForgotPasswordScreen.routeName,
                name: ForgotPasswordScreen.routeName,
                pageBuilder: (_, GoRouterState state) {
                  return getCustomTransitionPage(
                    state: state,
                    child: const ForgotPasswordScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: ResetLinkScreen.routeName,
                    name: ResetLinkScreen.routeName,
                    pageBuilder: (_, GoRouterState state) {
                      return getCustomTransitionPage(
                        state: state,
                        child: const ResetLinkScreen(),
                      );
                    },
                  ),
                ])
          ]),
      GoRoute(
        path: "/${RegisterScreen.routeName}",
        name: RegisterScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const RegisterScreen(),
          );
        },
      ),
      GoRoute(
        path: "/${EmailVerificationScreen.routeName}",
        name: EmailVerificationScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const EmailVerificationScreen(),
          );
        },
      ),
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
            )
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
