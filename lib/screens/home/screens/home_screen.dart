import 'package:adminease/common/widgets/text_widget.dart';
import 'package:adminease/models/user.dart';
import 'package:adminease/providers/user_provider.dart';
import 'package:adminease/screens/home/screens/no_escolas.dart';
import 'package:adminease/screens/login/screens/log_in.dart';
import 'package:adminease/screens/login/widget/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: user.escola.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "BANCO DE DADOS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.sp),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      text16Normal(
                          text:
                              "Para começar a usar o aplicativo, você precisa criar um banco de dados para armazenar registros de entradas e saidas de funcionarios e alunos de acordo com a opção escolhida"),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  builder: (context) => Container(
                                        height: 500.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              text16Normal(
                                                  text: "Nome da escola"),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Container(
                                              
                                                height: 40.h,
                                                color: Colors.grey.shade200,
                                                child: TextField(
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Nome da escola ou empresa",
                                                      border: const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent)),
                                                      enabledBorder:
                                                          const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .transparent)),
                                                      focusedBorder:
                                                          const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .transparent))),
                                                  onChanged: (value) {},
                                                  maxLines: 1,
                                                  autocorrect: false,
                                                  obscureText: false,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                              child: Text("Criar"),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Satoshi',
                                ),

                                backgroundColor: Color(0xff3ac4ac),
                                // Define o botão como redondo
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15
                                        .w), // Ajuste o tamanho do botão conforme necessário
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UserInfo(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(User user, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: const Text(
          "👏 Óla",
        ),
      ),
      subtitle: Text(
        user.name,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w700),
      ),
      trailing: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/474x/4c/3e/3b/4c3e3b91f05a5765aa544ac7557d6642.jpg"),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff3ac4ac).withOpacity(0.6),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                  style: BorderStyle.solid,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.black12, Colors.black26],
        ),
      ),
      child: AnimatedIconWidget(),
    );
  }

  Widget _buildButtonList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < 4; i++)
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff3ac4ac),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 50.h,
              height: 50.h,
              child: Center(
                child: Image.network(
                  "https://icon-library.com/images/send-icon-png/send-icon-png-2.jpg",
                  fit: BoxFit.contain,
                  height: 30.h,
                  width: 30.h,
                ),
              ),
            ),
            onPressed: () {},
          ),
      ],
    );
  }
}

class AnimatedIconWidget extends StatefulWidget {
  @override
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget> {
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() async {
    if (mounted) {
      // Check if the widget is still mounted before calling setState
      setState(() {
        isAnimating = true;
      });
      await Future.delayed(Duration(seconds: 2));
      if (mounted) {
        // Check again before updating the state
        setState(() {
          isAnimating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: isAnimating
          ? CircularProgressIndicator() // Substitua por um ícone animado desejado
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Colegio Adventista do gama"),
                      Text("Turno: Manhã")
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Image.network(
                    "https://imagepng.org/nfc-icone-icon/nfc-icon/",
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Total de registros: 0"),
                )
              ],
            ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Padding(
        padding: EdgeInsets.only(bottom: 7),
        child: Text("👋 Hello!"),
      ),
      subtitle: Text(
        "Shahin Alam",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w700),
      ),
      trailing: Container(
        width: 48.0,
        height: 48.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/7153/7153150.png"),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 18.0,
              height: 18.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff1C6BA4),
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
