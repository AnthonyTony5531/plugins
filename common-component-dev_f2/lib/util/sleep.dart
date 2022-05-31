
import 'dart:async';

Future sleep(int milliseconds, [FutureOr computation()]){
  return Future.delayed(Duration(milliseconds: milliseconds), computation);
}