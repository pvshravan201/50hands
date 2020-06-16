import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';



void main() => runApp(Payment());

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  Future<void> _launched;
  String toLaunch1 = 'http://developer.50hands.org/support/volunteer-signup/';
  String toLaunch2 = 'http://developer.50hands.org/support/organizations/';





  static const platform = const MethodChannel("razorpay_flutter");
  bool check = false;
  bool check1 = false;
  String mon="";
  List<bool> pressAttention=[false,true,true,true,true,true,true];
  List<int> money=[700,1400,30*70,40*70,50*70,60*70,100*70];
  Razorpay _razorpay;
  bool show=false;


   Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
          
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Support",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                 
              ),
            ),
          ),
          elevation: 0.0,
        ),
            // backgroundColor: Colors.yellow,
            body: SingleChildScrollView (
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("50-Hands Organization is established to galvanize the Canadian Volunteer & Maker community  to support the Government and other  institutions to address community challenges.",style:TextStyle(letterSpacing: 1.5,fontSize: 15)),
                  ),
                ),
                SizedBox(height: 15,),
                    Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                 GestureDetector(
                           onTap: (){ setState(() {
                            _launched = _launchInWebViewWithJavaScript(toLaunch1);

                           });},
                            child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.yellow[400],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Be A Volunteer",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),),
                              ],
                            ),
                          ),
                        ),
                         GestureDetector(
                           onTap: (){ setState(() {
                             _launched = _launchInWebViewWithJavaScript(toLaunch2);

                           });},
                            child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Join Us",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
              ],
            ),
            SizedBox(height: 20,),
                       Card(
                         elevation: 50,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20),
                              ),
                    borderOnForeground: true,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0,16.0,16.0,0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom:8.0),
                                  child: AutoSizeText('Make your Donations Here ',style: TextStyle(fontSize:22,
                                  color: Colors.black,fontFamily: 'Roboto/Roboto-Medium',),maxLines: 1,),
                                ),
                            Divider(indent: 60,endIndent: 60,thickness: 2,color: Colors.lime,),

                            SizedBox(height: 8,),
                  Text('Remember that the happiest people are not those getting more but those giving more',
                        style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'Roboto/Roboto-Light', ),),
                        SizedBox(height: 8.0,),
                        Wrap(
                          runSpacing: 5.0,
                          spacing: 8.0,
                          children: <Widget>[
                          RaisedButton.icon(
                                color: pressAttention[0] ? Colors.grey : Color.fromRGBO(163,21,71,1),
                                textColor: Colors.white,
                                icon: Icon(Icons.monetization_on,color: Colors.white,),
                                label: Text('10'),
                                onPressed: () => setState((){ pressAttention[0] = false;
                                for(int i=0;i<pressAttention.length;i++){
                                    if(i!=0)  pressAttention[i]=true;
                                    else pressAttention[i]=false;
                                  }
                                  show=false;
                                }),
                          ),
                          RaisedButton.icon(
                                icon: Icon(Icons.monetization_on,color: Colors.white,),
                                label: Text('20'),
                                textColor: Colors.white,
                                color: pressAttention[1] ? Colors.grey : Color.fromRGBO(163,21,71,1),
                                onPressed: () => setState((){// pressAttention[1] = !pressAttention[1];
                                  for(int i=0;i<pressAttention.length;i++){
                                    if(i!=1)  pressAttention[i]=true;
                                    else pressAttention[i]=false;
                                  }
                                  show=false;
                                }),
                          ),
                          RaisedButton.icon(
                                icon: Icon(Icons.monetization_on,color: Colors.white,),
                                label: Text('30'),
                                textColor: Colors.white,
                                color: pressAttention[2] ? Colors.grey : Color.fromRGBO(163,21,71,1),
                                onPressed: () => setState((){ //pressAttention[2] = !pressAttention[2];
                                for(int i=0;i<pressAttention.length;i++){
                                    if(i!=2)  pressAttention[i]=true;
                                    else pressAttention[i]=false;
                                  }
                                  show=false;
                                }),
                          ),
                          RaisedButton.icon(
                                icon: Icon(Icons.monetization_on,color: Colors.white,),
                                label: Text('40'),
                                textColor: Colors.white,
                                color: pressAttention[3] ? Colors.grey : Color.fromRGBO(163,21,71,1),
                                onPressed: () => setState((){ //pressAttention[3] = !pressAttention[3];
                                for(int i=0;i<pressAttention.length;i++){
                                    if(i!=3)  pressAttention[i]=true;
                                    else pressAttention[i]=false;
                                  }
                                  show=false;
                                }),
                          ),
                          RaisedButton.icon(
                                icon: Icon(Icons.monetization_on,color: Colors.white,),
                                label: Text('50'),
                                textColor: Colors.white,
                                color: pressAttention[4] ? Colors.grey : Color.fromRGBO(163,21,71,1),
                                onPressed: () => setState((){ //pressAttention[4] = !pressAttention[4];
                                for(int i=0;i<pressAttention.length;i++){
                                    if(i!=4)  pressAttention[i]=true;
                                    else pressAttention[i]=false;
                                  }
                                  show=false;
                                }),
                          ),
                          RaisedButton.icon(
                                icon: Icon(Icons.monetization_on,color: Colors.white,),
                                label: Text('60'),
                                textColor: Colors.white,
                                color: pressAttention[5] ? Colors.grey : Color.fromRGBO(163,21,71,1),
                                onPressed: () => setState((){ //pressAttention[5] = !pressAttention[5];
                                for(int i=0;i<pressAttention.length;i++){
                                    if(i!=5)  pressAttention[i]=true;
                                    else pressAttention[i]=false;
                                  }
                                  show=false;
                                }),
                          ),
                          OutlineButton.icon(
                                icon: Icon(Icons.monetization_on,),
                                label: Text('other'),
                                textColor: pressAttention[6] ? Colors.grey : Color.fromRGBO(163,21,71,1),
                                onPressed: () => setState((){ //pressAttention[6] = !pressAttention[6];
                                for(int i=0;i<pressAttention.length;i++){
                                    if(i!=6)  pressAttention[i]=true;
                                    else pressAttention[i]=false;
                                  }
                                  show=true;
                                }),
                          ),
                          Visibility(
                                visible: show,
                                 child: TextField(
                                   maxLength: 6,
                                   keyboardType: TextInputType.number,
                                   onChanged: (String str){
                                     mon=str;
                                   },
                                ),
                          ),
                        ],),

                        SizedBox(height: 8.0,),
                        Row(children: <Widget>[
                          Checkbox(value: check,
                                      onChanged:(bool value){
                                    setState(() {
                                      check=value;
                                    });
                                }),
                                Column(
                                  children: <Widget>[
                                    Text('For a greater Good.',
                                    style: TextStyle(fontSize: 11),
                                    ),
                                  ],
                                )]),

                        SizedBox(height: 8.0,),
                        Center(
                          child: Text('Recurring Contribution:',
                          style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Roboto/Roboto-Medium', ),),
                        ),
                        Divider(indent: 60,endIndent: 60,thickness: 1,color: Colors.lime,),
                        SizedBox(height: 8.0,),
                        Text('Give Monthly for the greater good every needy step off their sidelines!!:',
                        style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'Roboto/Roboto-Light', ),),
                        SizedBox(height: 8.0,),
                        Row(children: <Widget>[
                        Checkbox(value: check1,
                                      onChanged:(bool value){
                                    setState(() {
                                      check1=value;
                                    });
                        }),
                        AutoSizeText('Let Me remind every month',
                        style: TextStyle(fontSize: 11),
                        minFontSize: 8,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,)]),
                        SizedBox(height: 8.0,),
                        Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                                RaisedButton(color: Colors.black,
                                textColor: Colors.white,

                                onPressed:(){ if(check==true){

                                  if(show==true && mon.isEmpty){
                                    Fluttertoast.showToast(msg: "Enter the amount", toastLength: Toast.LENGTH_SHORT);
                                    } else{
                                        openCheckout();
                                    }
                                  }
                                else{
                                  Fluttertoast.showToast(msg: "Check Box is ticked", toastLength: Toast.LENGTH_SHORT);
                                  setState(() {
                                   check=true;
                                  });
                                  }
                                }, child: Shimmer.fromColors(
                                        baseColor: Colors.white,
                                        highlightColor: Colors.grey   ,
                                        period: Duration(seconds: 2),
                                        child: Text('Donate',style: TextStyle(fontSize: 18),),)),
                            SizedBox(height: 20.0,),

                          ],
                        ),
                      ]),
                    )
                  ),
                    ])),
                              ],
                            ),
            ),
           ),
    );
              //),

          
      //);
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    int i=0;
    for(bool val in pressAttention){
      if(val==false){
        break;
      }
      i++;
    }
    int real=0;
    if(i==6){
      real=int.parse(mon);
    } else real=money[i];
    real*=100;
    
    var options = {
      'key': 'rzp_test_27X7tKgXN5ZcVq',
      'amount': real,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, toastLength: Toast.LENGTH_SHORT);
  }
}