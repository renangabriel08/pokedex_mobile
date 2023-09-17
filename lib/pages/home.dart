import 'package:flutter/material.dart';
import 'package:pokedex/controllers/api_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String id = '1';
  String nome = 'Bulbasaur';
  String img =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png';
  int numId = 1;
  @override
  Widget build(BuildContext context) {
    double widthTela = MediaQuery.of(context).size.width;
    double heightTela = MediaQuery.of(context).size.height;

    final fieldTextController = TextEditingController();

    void limparTexto() {
      fieldTextController.clear();
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff6ab7f5),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/pokedex.png',
                  width: widthTela * .8,
                ),
                Positioned(
                  top: heightTela * .19,
                  child: Image.network(
                    img,
                    width: widthTela * .2,
                  ),
                ),
                Positioned(
                  top: heightTela * .323,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$id- ',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xffaaaaaa),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        nome,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xff3a444d),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: heightTela * .38,
                  left: widthTela * .09,
                  child: Container(
                    width: widthTela * .565,
                    height: heightTela * .05,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: Color(0xFF333333),
                          width: 2,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF333333),
                          offset: Offset(-4, 6),
                          blurRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0xFF888888),
                          offset: Offset(-2, 3),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: SizedBox(
                        width: widthTela * .56,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 5),
                          child: TextField(
                            cursorColor: const Color(0xFF444444),
                            controller: fieldTextController,
                            onChanged: (value) => id = value,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  List res =
                                      await ApiController.pesquisarPokemon(id);
                                  setState(() {
                                    img = res[0];
                                    id = res[1];
                                    nome = res[2];
                                    String primeiraLetra =
                                        nome[0].toUpperCase();
                                    nome = nome.replaceFirst(
                                        nome[0], primeiraLetra);
                                    numId = int.parse(id);
                                    limparTexto();
                                  });
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: Color(0xFF444444),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: heightTela * .47,
                  left: widthTela * .092,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          List res = await ApiController.botoesPokemon(
                            numId,
                            'anterior',
                          );
                          setState(() {
                            img = res[0];
                            id = res[1];
                            nome = res[2];
                            String primeiraLetra = nome[0].toUpperCase();
                            nome = nome.replaceFirst(nome[0], primeiraLetra);
                            numId = int.parse(id);
                          });
                        },
                        child: Container(
                          width: widthTela * .25,
                          height: heightTela * .045,
                          decoration: const BoxDecoration(
                            color: Color(0xFF444444),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF000000),
                                offset: Offset(-4, 6),
                                blurRadius: 0,
                              ),
                              BoxShadow(
                                color: Color(0xFF222222),
                                offset: Offset(-2, 3),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              '< Anterior',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: widthTela * .06),
                      GestureDetector(
                        onTap: () async {
                          List res = await ApiController.botoesPokemon(
                            numId,
                            'proximo',
                          );
                          setState(() {
                            img = res[0];
                            id = res[1];
                            nome = res[2];
                            String primeiraLetra = nome[0].toUpperCase();
                            nome = nome.replaceFirst(nome[0], primeiraLetra);
                            numId = int.parse(id);
                          });
                        },
                        child: Container(
                          width: widthTela * .25,
                          height: heightTela * .045,
                          decoration: const BoxDecoration(
                            color: Color(0xFF444444),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF000000),
                                offset: Offset(-4, 6),
                                blurRadius: 0,
                              ),
                              BoxShadow(
                                color: Color(0xFF222222),
                                offset: Offset(-2, 3),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Próximo >',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
