import 'package:flutter/material.dart';
import 'package:mercadopago_sdk/mercadopago_sdk.dart';
import 'package:pix_flutter/pix_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pix Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Exemplo API Pix Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String mpTESTPublicKey = "TEST-81821349-a707-44b3-ae21-55e337f29261";
  String mpTESTAccessToken =
      "TEST-6296082637470114-052001-d820ffbb793f8a217f0630136e46adfb-1127027433";
  String mpPublicKey = "APP_USR-cdeac06a-33a9-4c86-825b-fe38106ce79a";
  String mpAccessToken =
      "APP_USR-6296082637470114-052001-8f1a3f921e6b02df57864addc16dc904-1127027433";

  String mpClientID = "6296082637470114";
  String mpClientSecret = "c07BIJ4SYFAPrrMjuorNCEB0wtQYYdVW";

  mercadoPagoOK() async {
    MP mp = await MP.fromAccessToken(mpAccessToken);
    final preference = {
      "date_of_expiration": "2027-06-12T21:52:49.000-04:00",
      "transaction_amount": 7.99,
      "description": "Título do produto",
      "payment_method_id": "pix",
      "items": [
        {
          "title": "Test Modified",
          "quantity": 1,
          "currency_id": "BRL",
          "unit_price": 7.99
        }
      ],
      "payer": {
        "email": "test@test.com",
        "first_name": "Test",
        "last_name": "User",
        "phone": {"area_code": "11", "number": "911601652"},
        "identification": {"type": "CPF", "number": "19119119100"},
        "address": {
          "zip_code": "06233200",
          "street_name": "Av. das Nações Unidas",
          "street_number": "3003",
          "neighborhood": "Bonfim",
          "city_name:": "Osasco",
          "federal_unit": "SP"
        }
      }
    };
    final result = await mp.createPreference(preference);
    try {
      final result2 = await mp.post("/v1/payments", data: {
        "transaction_amount": 7.99,
        "description": "Título do produto",
        "payment_method_id": "pix",
        "payer": {
          "email": "test@test.com",
          "first_name": "Test",
          "last_name": "User",
          "identification": {"type": "CPF", "number": "19119119100"},
          "address": {
            "zip_code": "06233200",
            "street_name": "Av. das Nações Unidas",
            "street_number": "3003",
            "neighborhood": "Bonfim",
            "city": "Osasco",
            "federal_unit": "SP"
          }
        }
      });
      print(result2["response"]["point_of_interaction"].toString());
    } catch (e) {
      print(e.toString());
    }
  }

  void mercadoPagoERROR(error) {
    print("error $error");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: mercadoPagoOK,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Center(
                    child: Text(
                      'Criar',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )),
          TextButton(
              onPressed: () async {},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Center(
                    child: Text(
                      'Revisar',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )),
        ],
      )),
    );
  }
}
