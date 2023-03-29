import 'package:flutter/material.dart';

class AnimatedPageRoute extends PageRouteBuilder{
  final Widget screen;
  AnimatedPageRoute({required this.screen})
      :super(
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,Widget child){
        return ScaleTransition(scale: animation,alignment: Alignment.center,child: child);
      },
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation){
        return screen;
      });
}


class BottomToRight extends PageRouteBuilder{
  final Widget screen;
  BottomToRight({required this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0,1.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0,1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}

class BottomToLeft extends PageRouteBuilder{
  final Widget screen;
  BottomToLeft({required this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0,1.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(-0.0,1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}


class TopToRight extends PageRouteBuilder{
  final Widget screen;
  TopToRight({required this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0,-1.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0,1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}


class RightToLeft extends PageRouteBuilder{
  final Widget screen;
  RightToLeft({required this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0,0.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(-1.0,0.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}


class TopToBottom extends PageRouteBuilder{
  final Widget screen;
  TopToBottom({required this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0,-1.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0,-1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}


class TopLeft extends PageRouteBuilder{
  final Widget screen;
  TopLeft({required this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0,-1.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0,-1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}



class CurveAnimation extends PageRouteBuilder{
  final Widget screen;
  CurveAnimation({required this.screen})
      :super(
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,Widget child){
        animation= CurvedAnimation(
          parent: animation,
          curve: Curves.bounceIn,
        );
        return ScaleTransition(scale: animation,alignment: Alignment.center,child: child);
      },
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation){
        return screen;
      });
}


class CenterCurveAnimation extends PageRouteBuilder{
  final Widget screen;
  CenterCurveAnimation({required this.screen})
      :super(
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,Widget child){
        animation= CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCirc,
        );
        return ScaleTransition(scale: animation,alignment: Alignment.center,child: child);
      },
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation){
        return screen;
      });
}


class BottomTop extends PageRouteBuilder{
  final Widget screen;
  BottomTop({required this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0,1.0),
          end:  Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0,1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}

class LeftTop extends PageRouteBuilder{
  final Widget screen;
  LeftTop({required this.screen})
      :super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation) => screen,
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secAnimation,Widget child){
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0,1.0),
          end:  Offset.zero,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0,1.0),
            ).animate(secAnimation),
            child: child),
      );
    },
  );
}