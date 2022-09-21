import 'package:flutter/material.dart';
import 'package:ordem_servicos/core/services/share/share_service.dart';
import 'package:ordem_servicos/nf/domain/usecases/share_document/share_nf_usecase.dart';
import 'package:ordem_servicos/nf/extenal/datasource/share_nf_datasource.dart';
import 'package:ordem_servicos/nf/infra/repositorys/share_nf_repository.dart';
import 'package:provider/provider.dart';

import 'nf/presenter/controllers/nf_controller.dart';
import 'nf/presenter/pages/nf_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NfController(
        const ShareDocumentUsecase(
          ShareDocumentRepository(
            ShareDocumentDatasource(
              shareService: ShareService(),
            ),
          ),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NfPage(),
      ),
    );
  }
}
