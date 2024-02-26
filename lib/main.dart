<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quiz Game</title>
<style>
    #quiz-container {
        display: none;
    }
</style>
</head>
<body>
    <h1>Quiz Game</h1>
    <button onclick="startGame()">Start Game</button>
    <div id="quiz-container">
        <p id="question"></p>
        <input type="text" id="answer">
        <button onclick="checkAnswer()">Submit Answer</button>
    </div>

    <script>
        var questions = [
            { question: "What is 2 + 2?", answer: "4" },
            { question: "What is the capital of France?", answer: "Paris" },
            // Add more questions as needed
        ];

        var currentQuestionIndex;
        var correctAnswers = 0;

        function startGame() {
            shuffleQuestions();
            currentQuestionIndex = 0;
            correctAnswers = 0;
            document.getElementById('quiz-container').style.display = 'block';
            showQuestion();
        }

        function shuffleQuestions() {
            questions.sort(() => Math.random() - 0.5);
        }

        function showQuestion() {
            document.getElementById('question').textContent = questions[currentQuestionIndex].question;
        }

        function checkAnswer() {
            var userAnswer = document.getElementById('answer').value.trim().toLowerCase();
            var correctAnswer = questions[currentQuestionIndex].answer.toLowerCase();
            
            if (userAnswer === correctAnswer) {
                correctAnswers++;
                currentQuestionIndex++;
                if (currentQuestionIndex < questions.length) {
                    showQuestion();
                } else {
                    endGame();
                }
            } else {
                endGame();
            }
        }

        function endGame() {
            alert("Game Over! You got " + correctAnswers + " out of " + questions.length + " correct.");
            document.getElementById('quiz-container').style.display = 'none';
        }
    </script>
</body>
</html>