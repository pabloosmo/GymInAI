import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../models/models.dart';

abstract class ProgramIaApiService {
  Future<ProgramModel?> getProgramModel(String prompt);
}

class ProgramIaApiServiceImpl implements ProgramIaApiService {
  ProgramIaApiServiceImpl();

  @override
  Future<ProgramModel?> getProgramModel(String prompt) async {
    final GenerativeModel model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: dotenv.env['API_KEY']!,
    );
    final content = [
      Content.text(prompt),
    ];
    final aiResponse = await model.generateContent(content);

    if (aiResponse.text == null) {
      return null;
    } else {
      final String json =
          aiResponse.text!.substring(7, aiResponse.text!.length - 3);
      return programModelFromJson(json);
    }
  }
}
