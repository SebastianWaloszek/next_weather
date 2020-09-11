import 'dart:convert';
import 'dart:io';

T fixture<T>(String name) => jsonDecode(File('resources/json/$name').readAsStringSync()) as T;
