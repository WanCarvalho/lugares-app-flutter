import 'package:f05_lugares_app/components/drawer.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/providers/lugares.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LugaresForm extends StatefulWidget {
  @override
  State<LugaresForm> createState() => _LugaresForm();
}

class _LugaresForm extends State<LugaresForm> {
  List<String> paisesOptions = ['c1', 'c2', 'c3'];
  String _selectedPaisValue = 'c1';

  final TextEditingController idController = TextEditingController();
  final TextEditingController paisesController =
      TextEditingController(); // trocar por select com países já cadastrados
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController imagemUrlController = TextEditingController();
  final TextEditingController recomendacoesController = TextEditingController();
  final TextEditingController avaliacaoController = TextEditingController();
  final TextEditingController custoMedioController = TextEditingController();

  // Método para limpar os campos
  void _clearFields() {
    idController.clear();
    paisesController.clear();
    tituloController.clear();
    imagemUrlController.clear();
    recomendacoesController.clear();
    avaliacaoController.clear();
    custoMedioController.clear();
  }

  void _saveForm() {
    // Validar os valores do formulário
    final id = idController.text;
    final paises = paisesController.text.split(',');
    final titulo = tituloController.text;
    final imagemUrl = imagemUrlController.text;
    final recomendacoes =
        recomendacoesController.text.split(','); // Separar por vírgula
    final avaliacao = double.tryParse(avaliacaoController.text) ??
        0.0; // Converter para double, ou 0.0 se não for válido
    final custoMedio = double.tryParse(custoMedioController.text) ??
        0.0; // Converter para double, ou 0.0 se não for válido

    // Criar o objeto Lugar
    final lugar = Lugar(
      id: id,
      paises: paises,
      titulo: titulo,
      imagemUrl: imagemUrl,
      recomendacoes: recomendacoes,
      avaliacao: avaliacao,
      custoMedio: custoMedio,
    );

    final lugaresProvider =
        Provider.of<LugaresProvider>(context, listen: false);
    lugaresProvider
        .saveLugar(lugar); // Adiciona o novo lugar à lista de lugares

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Novo lugar foi adicionado.'),
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
    paisesController.dispose();
    tituloController.dispose();
    imagemUrlController.dispose();
    recomendacoesController.dispose();
    avaliacaoController.dispose();
    custoMedioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Adicionar Lugar",
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
            // Paises Field

            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedPaisValue,
                    items: paisesOptions.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPaisValue = newValue ?? _selectedPaisValue;
                      });
                    },
                  ),
                ),
              ],
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
            // Imagem URL Field
            TextField(
              controller: imagemUrlController,
              decoration: const InputDecoration(
                labelText: 'Imagem URL',
              ),
            ),
            const SizedBox(height: 8),
            // Recomendações Field
            TextField(
              controller: recomendacoesController,
              decoration: const InputDecoration(
                labelText: 'Recomendações (separadas por vírgula)',
              ),
            ),
            const SizedBox(height: 8),
            // Avaliação Field
            TextField(
              controller: avaliacaoController,
              decoration: const InputDecoration(
                labelText: 'Avaliação (de 0 a 5)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            // Custo Médio Field
            TextField(
              controller: custoMedioController,
              decoration: const InputDecoration(
                labelText: 'Custo Médio',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
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
