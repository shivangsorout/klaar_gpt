import 'package:flutter/material.dart';
import 'package:open_ai_test/extensions/context_extension.dart';
import 'package:open_ai_test/services/gemini_ai_service.dart';
import 'package:open_ai_test/utility/custom_widgets/intro_message.dart';
import 'package:open_ai_test/utility/custom_widgets/text_prompt_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextEditingController _controller;
  bool isLoading = false;
  String promptReply = '';
  String query = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KlaarGPT'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                promptReply = '';
                query = '';
              });
              // For resetting the state of the Form
              _formKey.currentState!.reset();
            },
            icon: const Icon(
              Icons.replay_outlined,
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.expand,
          children: [
            promptReply.isEmpty && query.isEmpty
                ? const IntroMessage()
                : Align(
                    alignment: Alignment.topLeft,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(context.mqSize.height * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User's query
                            Text(
                              query,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: context.mqSize.height * 0.03,
                              ),
                            ),
                            SizedBox(height: context.mqSize.height * 0.01),
                            // Query's answer
                            Visibility(
                              visible: isLoading,
                              replacement: Text(
                                promptReply,
                              ),
                              child: const Text(
                                'Loading...',
                              ),
                            ),
                            SizedBox(height: context.mqSize.height * 0.11)
                          ],
                        ),
                      ),
                    ),
                  ),
            // Textfield for the query
            Align(
              alignment: Alignment.bottomCenter,
              child: TextPromptField(
                disable: isLoading,
                controller: _controller,
                onPressed: isLoading
                    ? null
                    : () async {
                        try {
                          // Validating the textfield
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            query = _controller.text;
                            // Clearing the textfield
                            _controller.clear();
                            // Fetching the result for the user's query
                            final result = await GeminiAIService()
                                .getQueryResult(query: query);
                            // Storing the Prompt reply and showing it on the screen
                            promptReply = result;
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                        // Catching all the exceptions here
                        catch (error) {
                          setState(() {
                            isLoading = false;
                          });
                          promptReply = error.toString();
                        }
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
