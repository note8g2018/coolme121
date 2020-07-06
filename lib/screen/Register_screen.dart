import 'package:coolme121/widget/EmailContainer_widget.dart';
import 'package:coolme121/widget/Password1Container_widget.dart';
import 'package:coolme121/widget/Password2Container_widget.dart';
import 'package:coolme121/widget/UserNameContainer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/textStyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coolme121/constant/RegWidgets.dart';

class Register extends StatefulWidget
{
  static String route = 'Register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> with TickerProviderStateMixin
{
  AnimationController _controllerTranslate;
  AnimationController _controllerOthers;
  Animation<double> _animationSkew;
  Animation<double> _animationScale;
  Animation<double> _animationTranslate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controllerTranslate = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2,),
    );

    _controllerOthers = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2,),
    );

    _animationSkew = Tween<double>(
      begin: 0.0,
      end: -0.15,
    ).animate(
      CurvedAnimation(
      parent: _controllerOthers,
      curve: Interval(0.0, 1.0, curve: Curves.bounceInOut),
      ),
    );

    _animationScale = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(
      CurvedAnimation(
          parent: _controllerOthers,
          curve: Interval(0.0, 1.0, curve: Curves.easeInOutBack),
      ),
    );

    _animationTranslate = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
      parent: _controllerTranslate,
      curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerTranslate.dispose();
    _controllerOthers.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context)
  {
    final MediaQueryData mediaQueryDate = MediaQuery.of(context);
    final double width2 = mediaQueryDate.size.width;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,

        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Register",
            style: kAppBareStyle,
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0.0,
                left: 0.0,
                width: width2,
                child: AnimatedBuilder(
                  animation: _controllerOthers,
                  child: UserNameContainer(
                    onPressed: (){
                      _controllerTranslate.reset();
                      _animationTranslate = Tween<double>(
                        begin: 0.0,
                        end: 1.0,
                      ).animate(
                        CurvedAnimation(
                          parent: _controllerTranslate,
                          curve: Interval(0.0, 1.0, curve: Curves.easeInBack),
                        ),
                      );

                      _controllerOthers.forward().whenComplete(
                              () => _controllerTranslate.forward()
                                  .whenComplete(() => _controllerOthers.reverse())
                      );
                      
                    }),
                  builder: (BuildContext context, Widget child)
                  {
                    return AnimatedBuilder(
                      child: child,
                      animation: _controllerTranslate,
                      builder: (BuildContext context, Widget child)
                      {
                        return Transform(
                          child: child,
                          alignment: Alignment.center,
                          transform: Matrix4.skewX(_animationSkew.value)
                            ..scale(_animationScale.value)
                            ..translate(width2 * -_animationTranslate.value),
                        );
                      },
                    );
                  },
                  ),

              ),
              Positioned(
                top: 0.0,
                left: width2,
                width: width2,
                child: AnimatedBuilder(
                  child: AnimatedBuilder(
                    child: EmailContainer(
                      onPressedNext: (){
//_controllerTranslate.stop();
                        _controllerTranslate.reset();
                        _animationTranslate = Tween<double>(
                          begin: 1.0,
                          end: 2.0,
                        ).animate(
                          CurvedAnimation(
                            parent: _controllerTranslate,
                            curve: Interval(0.0, 1.0, curve: Curves.easeInBack),
                          ),
                        );

                        _controllerOthers.forward().whenComplete(
                                () => _controllerTranslate.forward()
                                .whenComplete(() => _controllerOthers.reverse())
                        );
                      },
                      onPressedBack: (){

                        _controllerTranslate.reset();
                        _animationTranslate = Tween<double>(
                          begin: 1.0,
                          end: 0.0,
                        ).animate(
                          CurvedAnimation(
                            parent: _controllerTranslate,
                            curve: Interval(0.0, 1.0, curve: Curves.easeInBack),
                          ),
                        );

                        _controllerOthers.forward().whenComplete(
                                () => _controllerTranslate.forward()
                                .whenComplete(() => _controllerOthers.reverse())
                        );
                      },
                    ),
                    animation: _controllerTranslate,
                    builder: (BuildContext context, Widget child)
                    {
                      return Transform(
                        alignment: Alignment.center,
                        child: child,
                        transform: Matrix4.skewX(_animationSkew.value)
                          ..scale(_animationScale.value)
                          ..translate(width2 * -_animationTranslate.value),
                      );
                    },
                  ),
                  animation: _controllerOthers,
                  builder: (BuildContext context, Widget child)
                  {
                    return child;
                  },
                ),
              ),
              Positioned(
                top: 0.0,
                left: (2*width2),
                width: width2,
                child: AnimatedBuilder(
                  child: Password1Container(
                    onPressedNext: (){

                      _controllerTranslate.reset();
                      _animationTranslate = Tween<double>(
                        begin: 2.0,
                        end: 3.0,
                      ).animate(
                        CurvedAnimation(
                          parent: _controllerTranslate,
                          curve: Interval(0.0, 1.0, curve: Curves.easeInBack),
                        ),
                      );

                      _controllerOthers.forward().whenComplete(
                              () => _controllerTranslate.forward()
                              .whenComplete(() => _controllerOthers.reverse())
                      );
                    },
                    onPressedBack: (){

                      _controllerTranslate.reset();
                      _animationTranslate = Tween<double>(
                        begin: 2.0,
                        end: 1.0,
                      ).animate(
                        CurvedAnimation(
                          parent: _controllerTranslate,
                          curve: Interval(0.0, 1.0, curve: Curves.easeInBack),
                        ),
                      );

                      _controllerOthers.forward().whenComplete(
                              () => _controllerTranslate.forward()
                              .whenComplete(() => _controllerOthers.reverse())
                      );
                    },
                  ),
                  animation: _controllerOthers,
                  builder: (BuildContext context, Widget child)
                  {
                    return AnimatedBuilder(
                      child: child,
                      animation: _controllerTranslate,
                      builder: (BuildContext context, Widget child)
                      {
                        return Transform(
                          alignment: Alignment.center,
                          child: child,
                          transform: Matrix4.skewX(_animationSkew.value)
                            ..scale(_animationScale.value)
                            ..translate(width2 * -_animationTranslate.value),
                        );
                      },
                    );
                  },
                ),
              ),
              Positioned(
                top: 0.0,
                left: 3*width2,
                width: width2,
                child: AnimatedBuilder(
                  child: Password2Container(
                    onRegister: (){

                    },
                    onPressedBack: (){

                      _controllerTranslate.reset();
                      _animationTranslate = Tween<double>(
                        begin: 3.0,
                        end: 2.0,
                      ).animate(
                        CurvedAnimation(
                          parent: _controllerTranslate,
                          curve: Interval(0.0, 1.0, curve: Curves.easeInBack),
                        ),
                      );

                      _controllerOthers.forward().whenComplete(
                              () => _controllerTranslate.forward()
                              .whenComplete(() => _controllerOthers.reverse())
                      );
                    },
                  ),
                  animation: _controllerOthers,
                  builder: (BuildContext context, Widget child)
                  {
                    return AnimatedBuilder(
                      child: child,
                      animation: _controllerTranslate,
                      builder: (BuildContext context, Widget child)
                      {
                        return Transform(
                          alignment: Alignment.center,
                          child: child,
                          transform: Matrix4.skewX(_animationSkew.value)
                            ..scale(_animationScale.value)
                            ..translate(width2 * -_animationTranslate.value),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


