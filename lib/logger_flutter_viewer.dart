/// Flutter widget for logger
library logger_flutter_viewer;

import 'dart:collection';
import 'dart:io';
import 'dart:ui';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

import 'src/ansi_parser.dart';
import 'src/shake_detector.dart';

part 'src/log_console_on_shake.dart';
part 'src/log_console.dart';
