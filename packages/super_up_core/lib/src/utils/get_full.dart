import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GetFull<T extends StatefulWidget, TBind extends Object>
    extends State<T> {
  TBind get controller => GetInstance().find<TBind>();
}
