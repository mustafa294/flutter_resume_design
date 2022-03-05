
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late pw.Document doc;

  _orderHistoryPdf(double width, double height, pw.ImageProvider image, pw.ImageProvider locationImage, pw.ImageProvider phone, pw.ImageProvider emailImage, pw.ImageProvider webImage, {pw.Font? font}) {
    return pw.Container(
      width: width,
      // height: height,
      padding: const pw.EdgeInsets.all(60),
      // decoration: pw.BoxDecoration(
      //   image: pw.DecorationImage(
      //     image: image,
      //     fit: pw.BoxFit.contain,
      //   ),
      // ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(children: [
                pw.SizedBox(height: 50),
                pw.Text(
                  'Company Name',
                  style: pw.TextStyle(
                    fontSize: 25,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blue,
                  ),
                ),
                pw.Text(
                  'Slogan Here',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blue,
                  ),
                ),
              ]),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Row(children: [
                    pw.Text(
                      'Address',
                      style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColors.black,
                      ),
                    ),
                    pw.Image(
                      locationImage,
                      width: 30,
                      height: 30,
                    ),
                  ]),
                  pw.Row(children: [
                    pw.Text(
                    'Phone',
                    style: pw.TextStyle(
                      fontSize: 12,
                      color: PdfColors.black,
                    ),
                  ),
                  pw.SizedBox(width: 10),
                    pw.Image(
                      phone,
                      width: 20,
                      height: 20,
                    ),
                  ]),
                  pw.SizedBox(height: 5),
                  pw.Row(children: [
                    pw.Text(
                    'Email',
                    style: pw.TextStyle(
                      fontSize: 12,
                      color: PdfColors.black,
                    ),
                  ),
                  pw.SizedBox(width: 10),
                    pw.Image(
                      emailImage,
                      width: 20,
                      height: 20,
                    ),
                  ]),
                  pw.SizedBox(height: 5),
                  pw.Row(children: [
                    pw.Text(
                    'Website',
                    style: pw.TextStyle(
                      fontSize: 12,
                      color: PdfColors.black,
                    ),
                  ),
                  pw.SizedBox(width: 10),
                    pw.Image(
                      webImage,
                      width: 20,
                      height: 20,
                    ),
                  ]),
                  
                  
                ],
              )
            ],
          ),
          pw.SizedBox(height: 50),
          pw.Text(
            "To,",
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            "John Doe",
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            "Art Director",
            style: pw.TextStyle(),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            "Global Technology",
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            "Address",
            style: pw.TextStyle(),
          ),
          pw.Text(
            "Address",
            style: pw.TextStyle(),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: pw.TextStyle(),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
            style: pw.TextStyle(),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
            style: pw.TextStyle(),
          ),
          pw.SizedBox(height: 30),
          pw.Container(child: pw.Text("Signature")),
          pw.Text("Charles Joe",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              )),
          pw.Text(
            "Graphic Designer",
            // style: pw.TextStyle(
            //   fontWeight: pw.FontWeight.bold,
            // )
          )
        ],
      ),
    );
  }

  generateOrderHistoryPdf() async {
    doc = pw.Document(deflate: zlib.encode);
    final image = await imageFromAssetBundle('assets/back.png');
    final locationImage = await imageFromAssetBundle('assets/location.png');
    final phoneImage = await imageFromAssetBundle('assets/phone.png');
    final emailImage = await imageFromAssetBundle('assets/email.png');
    final webImage = await imageFromAssetBundle('assets/web.png');
    final pageTheme = pw.PageTheme(
      margin: pw.EdgeInsets.all(0),
      buildBackground: (context) => pw.Image(
        image,
      ),
      theme: pw.ThemeData.withFont(
        base: await PdfGoogleFonts.openSansRegular(),
        bold: await PdfGoogleFonts.openSansBold(),
        icons: await PdfGoogleFonts.materialIcons(),
        //   base: pw.Font.ttf(await rootBundle.load("assets/OpenSans-Regular.ttf")),
        //   bold: pw.Font.ttf(await rootBundle.load("assets/OpenSans-Bold.ttf")),
        //   italic:
        //       pw.Font.ttf(await rootBundle.load("assets/OpenSans-Regular.ttf")),
        //   boldItalic:
        //       pw.Font.ttf(await rootBundle.load("assets/OpenSans-Regular.ttf")),
      ),
      // theme: pw.ThemeData.withFont(
      //     base: pw.Font.ttf(
      //         await rootBundle.load("assets/OpenSans-Regular.ttf"))),
      pageFormat: PdfPageFormat.a4,
    );

    doc.addPage(
        pw.MultiPage(
          // footer: (context) {
          //   return context.pageNumber == context.pagesCount
          //       ? pw.Footer(
          //           title: pw.Text(
          //             "This is automated computer generated invoice for Clients would use for their purpose",
          //             style: pw.TextStyle(
          //               fontWeight: pw.FontWeight.bold,
          //             ),
          //           ),
          //         )
          //       : pw.Text("");
          // },
          pageTheme: pageTheme,
          build: (context) => [
            _orderHistoryPdf(
              pageTheme.pageFormat.width,
              pageTheme.pageFormat.height,
              image,
              locationImage,
              phoneImage,
              emailImage,
              webImage,
              // font: pageTheme.theme!.iconTheme.font,
            ),
          ],
        ),
        index: 0);
  }

  _printPage(BuildContext context) async {
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            generateOrderHistoryPdf();
            await _printPage(context);
          },
          child: Text("Show Data"),
        ),
      ),
    );
  }
}
