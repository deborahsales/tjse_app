import 'package:disp_moveis/authentication/components/show_snackbar.dart';
import 'package:disp_moveis/authentication/services/auth_service.dart';
import 'package:disp_moveis/components/constantes.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  bool isEntrando = true;

  final _formKey = GlobalKey<FormState>();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(219, 238, 255, 1.0),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(32),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset('assets/images/logo.png', height: 64,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (isEntrando) ? "Bem-vindo!" : "Vamos começar?",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        (isEntrando)
                            ? "Faça login para realizar consultas às folhas de pagamento do TJSE."
                            : "Faça seu cadastro para realizar consultas às folhas de pagamento do TJSE.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black12),
                        height: 65,
                        width: 290,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                label: Text(
                                  "E-mail...",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never),
                            validator: (value) {
                              if (value == null || value == "") {
                                return "O valor de e-mail deve ser preenchido";
                              }
                              if (!value.contains("@") ||
                                  !value.contains(".") ||
                                  value.length < 4) {
                                return "O valor do e-mail deve ser válido";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black12),
                        height: 65,
                        width: 290,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _senhaController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                "Senha...",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            validator: (value) {
                              if (value == null || value.length < 4) {
                                return "Insira uma senha válida.";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isEntrando,
                      child: TextButton(
                        onPressed: () {
                          esqueciMinhaSenhaClidado();
                        },
                        child: const Text('Esqueci minha senha'),
                      ),
                    ),
                    Visibility(
                        visible: !isEntrando,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black12),
                                height: 65,
                                width: 290,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _confirmaController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      label: Text(
                                        "Confirme a senha...",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.length < 4) {
                                        return "Insira uma confirmação de senha válida.";
                                      }
                                      if (value != _senhaController.text) {
                                        return "As senhas devem ser iguais.";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black12),
                                height: 65,
                                width: 290,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _nomeController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      label: Text(
                                        "Nome...",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.length < 3) {
                                        return "Insira um nome maior.";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        botaoEnviarClicado();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: myBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      child: Text(
                        (isEntrando) ? "Login" : "Cadastrar",
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isEntrando = !isEntrando;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          (isEntrando)
                              ? "Ainda não tem conta?\nClique aqui para cadastrar."
                              : "Já tem uma conta?\nClique aqui para entrar",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  botaoEnviarClicado() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    String nome = _nomeController.text;

    if (_formKey.currentState!.validate()) {
      if (isEntrando) {
        _entrarUsuario(email: email, senha: senha);
      } else {
        _criarUsuario(email: email, senha: senha, nome: nome);
      }
    }
  }

  _entrarUsuario({required String email, required String senha}) {
    authService.entrarUsuario(email: email, senha: senha).then((String? erro) {
      if (erro != null) {
        showSnackBar(
          context: context,
          mensagem: erro,
        );
      }
    });
  }

  _criarUsuario(
      {required String email, required String senha, required String nome}) {
    authService
        .cadastrarUsuario(
      email: email,
      senha: senha,
      nome: nome,
    )
        .then((String? erro) {
      if (erro != null) {
        showSnackBar(
          context: context,
          mensagem: erro,
        );
      }
    });
  }

  esqueciMinhaSenhaClidado() {
    String email = _emailController.text;
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController redefinicaoSenhaController =
            TextEditingController(text: email);
        return AlertDialog(
            title: const Text("Confirme o e-mail para redefinição de senha!"),
            content: TextFormField(
              controller: redefinicaoSenhaController,
              decoration:
                  const InputDecoration(label: Text('Confirme o e-mail...')),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32))),
            actions: [
              TextButton(
                  onPressed: () {
                    authService
                        .redefinicaoSenha(
                            email: redefinicaoSenhaController.text)
                        .then((String? erro) {
                      if (erro == null) {
                        showSnackBar(
                          context: context,
                          mensagem: "E-mail de redefinição enviado!",
                          isErro: false,
                        );
                      } else {
                        showSnackBar(
                          context: context,
                          mensagem: erro,
                        );
                      }
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Redefinir senha'))
            ]);
      },
    );
  }
}
