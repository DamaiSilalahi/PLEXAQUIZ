class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

class QuizData {
  static List<QuizQuestion> uiuxQuestions = [
    QuizQuestion(
      question: "What is the main goal of UX Design?",
      options: [
        "To make the app more colorful",
        "To improve user experience when using a product",
        "To increase website loading speed",
        "To add more features to the app"
      ],
      correctAnswer: 1,
    ),
    QuizQuestion(
      question: "UI stands for",
      options: ["User Interaction", "User Integration", "User Interface", "Unified Interaction"],
      correctAnswer: 2,
    ),
    QuizQuestion(
      question: "The color blue is often used because it represents",
      options: ["Energy and enthusiasm", "Trust and professionalism", "Danger and warning", "Nature and growth"],
      correctAnswer: 1,
    ),
    QuizQuestion(
      question: "A wireframe is used to...",
      options: ["Choose color schemes", "Test website performance", "Define structure and layout", "Write HTML code"],
      correctAnswer: 2,
    ),
    QuizQuestion(
      question: "One of the main principles of UI design is",
      options: ["Network speed", "Consistency", "Animation quantity", "Bright colors"],
      correctAnswer: 1,
    ),
    QuizQuestion(
      question: "In UX, 'Usability' refers to",
      options: ["How fast it loads", "How beautiful it looks", "How easy a product is to use", "How many features it has"],
      correctAnswer: 2,
    ),
    QuizQuestion(
      question: "Prototyping is done to",
      options: ["Set the price", "Test ideas and flow", "Write documentation", "Create icons"],
      correctAnswer: 1,
    ),
    QuizQuestion(
      question: "Which is a popular UI/UX tool?",
      options: ["VS Code", "Figma", "MySQL", "XAMPP"],
      correctAnswer: 1,
    ),
    QuizQuestion(
      question: "Typography deals with",
      options: ["Images", "Colors", "Fonts", "Page dimensions"],
      correctAnswer: 2,
    ),
    QuizQuestion(
      question: "User Persona is used to",
      options: ["Choose colors", "Identify target users", "Create logos", "Test servers"],
      correctAnswer: 1,
    ),
  ];

  static List<QuizQuestion> webQuestions = [
    QuizQuestion(
      question: "HTML is used for",
      options: ["Styling", "Structure", "Storage", "Backend logic"],
      correctAnswer: 1,
    ),
    QuizQuestion(
      question: "CSS is used to",
      options: ["Handle logic", "Connect DB", "Style pages", "Manage requests"],
      correctAnswer: 2,
    ),
    QuizQuestion(
      question: "The <a> tag is used to",
      options: ["Create list", "Add image", "Create hyperlink", "Display video"],
      correctAnswer: 2,
    ),
    QuizQuestion(
      question: "Which of these is a CSS framework?",
      options: ["Django", "Laravel", "Bootstrap", "Node.js"],
      correctAnswer: 2,
    ),
    QuizQuestion(
      question: "JavaScript is used for...",
      options: ["Layout", "Interactivity", "Security", "Storage"],
      correctAnswer: 1,
    ),
    QuizQuestion(
      question: "To make text bold in HTML, use...",
      options: ["<strong>", "<i>", "<em>", "<u>"],
      correctAnswer: 0,
    ),
    QuizQuestion(
      question: "CSS stands for",
      options: ["Creative Style Syntax", "Cascading Style Sheets", "Computer System Style", "Custom Script System"],
      correctAnswer: 1,
    ),
    QuizQuestion(
      question: "JS files are linked with",
      options: ["<script>", "<link>", "<style>", "<code>"],
      correctAnswer: 0,
    ),
    QuizQuestion(
      question: "The <div> element is used to",
      options: ["Display image", "Create a container", "Add connectivity", "Include metadata"],
      correctAnswer: 1,
    ),
    QuizQuestion(
      question: "A responsive website means",
      options: ["Offline use", "Adjusts to screen sizes", "Has animations", "Protected from hacking"],
      correctAnswer: 1,
    ),
  ];
}
