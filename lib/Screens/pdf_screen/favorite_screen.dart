import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hieroglyphic_app/Screens/pdf/pdf_view.dart';

import 'package:hieroglyphic_app/Screens/pdf_screen/pdf_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../compenets/constant/colors.dart';

class FeedbackScreen extends StatelessWidget {
  static const String routeName = 'favorite';

  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PdfCubit, PdfState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return  Scaffold(
          body: Column(children: [
            Expanded(child: LectureListView())
          ]),
        );
      },
    );
  }
}

class LectureListView extends StatelessWidget {
  const LectureListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: PdfCubit.get(context).pdfUrl.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PdfViewer(),
                  settings:RouteSettings(
                    arguments: PdfCubit.get(context).pdfUrl[index]
                  ) ));
            },
            child: Card(
              child: ListTile(
                title: Text("${AppLocalizations.of(context)!.lecture} ${index+1}"),
              //  subtitle: Text("Lec['subtitle'"),
              ),
            ),
          ),
        );
      },
    );
  }
}
