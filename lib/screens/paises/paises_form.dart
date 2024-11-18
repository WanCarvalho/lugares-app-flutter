import 'package:f05_lugares_app/components/drawer.dart';
import 'package:f05_lugares_app/model/pais.dart';
import 'package:f05_lugares_app/providers/paises.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PaisesForm extends StatefulWidget {
  @override
  State<PaisesForm> createState() => _PaisesForm();
}

class _PaisesForm extends State<PaisesForm> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController corController = TextEditingController();

  // A cor selecionada pelo usuário
  Color _corSelecionada = Colors.blue;

  // Método para limpar os campos
  void _clearFields() {
    idController.clear();
    tituloController.clear();
    corController.clear();
    _corSelecionada = Colors.blue; // Resetando a cor para o padrão
  }

  // Função para exibir o ColorPicker
  void _selectColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecione uma cor'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _corSelecionada, // Cor inicial
              onColorChanged: (Color color) {
                setState(() {
                  _corSelecionada = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                corController.text = _corSelecionada.toString(); // Salva a cor no controller
                Navigator.of(context).pop();
              },
              child: const Text('Confirmar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _saveForm() {
    // Validar os valores do formulário
    final id = idController.text;
    final titulo = tituloController.text;
    final cor = _corSelecionada;

    final pais = Pais(
      id: id,
      titulo: titulo,
      cor: cor,
    );

    final paisProvider = Provider.of<PaisesProvider>(context, listen: false);
    paisProvider.savePais(pais); // Adiciona o novo lugar à lista de lugares

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Novo país foi adicionado.'),
        duration: Duration(seconds: 5), // Duração do SnackBar
      ),
    );

    // Após o SnackBar, navegue para a tela principal
    Future.delayed(Duration(seconds: 0), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  void dispose() {
    // Limpando os controladores ao destruir o widget
    idController.dispose();
    tituloController.dispose();
    corController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Adicionar País",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeData().primaryColor,
      ),
      drawer: const MeuDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ID Field
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'ID',
              ),
            ),
            const SizedBox(height: 8),

            // Titulo Field
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            const SizedBox(height: 8),

            // Seleção de cor
            TextField(
              controller: corController,
              decoration: InputDecoration(
                labelText: 'Cor',
                hintText: 'Escolha a cor',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.color_lens),
                  onPressed: () => _selectColor(context), // Chama o color picker
                ),
              ), // Campo desabilitado, pois estamos usando o botão para escolher a cor
            ),
            const SizedBox(height: 8),

            // Botão para salvar
            ElevatedButton(
              onPressed: _saveForm,
              child: const Text('Salvar'),
            ),
            const SizedBox(height: 8),
            // Botão para limpar
            ElevatedButton(
              onPressed: _clearFields,
              child: const Text('Limpar Campos'),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true, // Adicionando ajuste ao teclado
    );
  }
}
