import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class KyraAssistant extends StatefulWidget {
  @override
  _KyraAssistantState createState() => _KyraAssistantState();
}

class _KyraAssistantState extends State<KyraAssistant> {
  final FlutterTts flutterTts = FlutterTts();
  final stt.SpeechToText speech = stt.SpeechToText();
  bool isListening = false;
  String recognizedText = '';
  String kyraResponse = '';

  @override
  void initState() {
    super.initState();
    _initializeTTS();
    _initializeSTT();
  }

  void _initializeTTS() async {
    await flutterTts.setLanguage('pt-BR');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
  }

  void _initializeSTT() async {
    bool available = await speech.initialize();
    if (!available) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Microfone não disponível')),
      );
    }
  }

  void _startListening() async {
    bool available = await speech.initialize();
    if (available) {
      setState(() => isListening = true);
      speech.listen(
        onResult: (result) {
          setState(() {
            recognizedText = result.recognizedWords;
          });
          if (result.finalResult) {
            _processCommand(recognizedText);
          }
        },
      );
    }
  }

  void _stopListening() {
    speech.stop();
    setState(() => isListening = false);
  }

  void _processCommand(String command) {
    String response = '';
    
    if (command.toLowerCase().contains('bom dia')) {
      response = 'Bom dia, Chef! Pronto para dominar o mercado global hoje?';
    } else if (command.toLowerCase().contains('faturamento')) {
      response = 'Chef, faturamos R\$12.500 em Reais, \$2.400 em Dólares, €2.200 em Euros e £1.900 em Libras esta semana! Crescimento global de 18.5%!';
    } else if (command.toLowerCase().contains('operação turbo')) {
      response = 'Iniciando Operação Turbo Global, Chef! Todas as plataformas sincronizadas para vendas em 4 moedas.';
    } else if (command.toLowerCase().contains('motivação')) {
      response = 'Chef, lembra quando começamos? Agora vendemos em Real, Dólar, Euro e Libra simultaneamente! O mundo é nosso mercado!';
    } else if (command.toLowerCase().contains('produto')) {
      response = 'Chef, estou analisando seu produto para vendas globais. Sugiro preços: R\$197 BRL, \$97 USD, €87 EUR, £77 GBP. Pronto para dominar 4 economias?';
    } else if (command.toLowerCase().contains('kyra')) {
      response = 'Estou aqui, Chef! Seu sistema de vendas globais em 4 moedas está operacional. Como posso acelerar seus resultados hoje?';
    } else if (command.toLowerCase().contains('plataforma')) {
      response = 'Chef, temos Kiwify e Meta Ads na Fase 1 para BRL/USD. Hotmart e Google Ads na Fase 2 para EUR/GBP. Todas preparadas para scaling global!';
    } else if (command.toLowerCase().contains('meta')) {
      response = 'Meta Fase 1: R\$18.000 em 30 dias. Meta Fase 2: R\$16.6M em 5 meses. Com vendas em 4 moedas, vamos superar em 300%!';
    } else if (command.toLowerCase().contains('global')) {
      response = 'Sistema global ativo: BRL para Brasil, USD para EUA, EUR para Europa, GBP para UK. Reinvestimento automático cruzado entre moedas!';
    } else {
      response = 'Comando processado, Chef! Continuando a operação em modo de excelência global multi-moeda.';
    }
    
    setState(() {
      kyraResponse = response;
    });
    
    _speak(response);
  }

  void _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '🎙️ KYRA - ASSISTENTE GLOBAL',
          style: TextStyle(color: Colors.amber),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.amber,
              child: Icon(
                Icons.public,
                size: 80,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            
            Text(
              isListening ? '🎙️ Kyra escutando...' : 'Kyra pronta para vendas globais, Chef!',
              style: TextStyle(
                color: isListening ? Colors.green : Colors.amber,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            
            if (recognizedText.isNotEmpty)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Você: $recognizedText',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            
            SizedBox(height: 20),
            
            if (kyraResponse.isNotEmpty)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'KYRA:',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      kyraResponse,
                      style: TextStyle(color: Colors.amber, fontSize: 16),
                    ),
                  ],
                ),
              ),
            
            Spacer(),
            
            GestureDetector(
              onTapDown: (_) => _startListening(),
              onTapUp: (_) => _stopListening(),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: isListening ? 120 : 100,
                height: isListening ? 120 : 100,
                decoration: BoxDecoration(
                  color: isListening ? Colors.green : Colors.amber,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: isListening ? Colors.green.withOpacity(0.5) : Colors.amber.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Icon(
                  Icons.mic,
                  size: isListening ? 60 : 50,
                  color: Colors.black,
                ),
              ),
            ),
            
            SizedBox(height: 20),
            Text(
              'Mantenha pressionado para falar com Kyra',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'Comandos: "faturamento", "operação turbo", "produto", "plataforma", "meta", "global"',
              style: TextStyle(color: Colors.grey, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    speech.stop();
    flutterTts.stop();
    super.dispose();
  }
}
