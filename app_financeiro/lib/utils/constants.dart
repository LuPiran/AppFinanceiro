import 'package:app_financeiro/page/conta/conta_page.dart';
import 'package:app_financeiro/page/grafico/grafico_page.dart';
import 'package:app_financeiro/page/home/home_page.dart';
import 'package:app_financeiro/page/transferencia/transferencia_page.dart';
import 'package:flutter/material.dart';

const List<Widget> screen = [
  HomePage(),
  TransferenciaPage(),
  GraficoPage(),
  ContaPage(),
];