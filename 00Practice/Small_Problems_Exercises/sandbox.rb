grade_book = [
  {subject: "English",
   grades: [
            {grade_id: 17, type: "Exam", score: 4},
            {grade_id: 18, type: "Quiz", score: 3.5},
            {grade_id: 19, type: "Quiz", score: 3},
            {grade_id: 20, type: "Quiz", score: 3.5},
            {grade_id: 21, type: "Quiz", score: 2.5}
          ]
  },
  {subject: "Band",
   grades: [
            {grade_id: 200, type: "Exam", score: 2},
            {grade_id: 201, type: "Performance", score: 4},
            {grade_id: 202, type: "Assignment", score: 4}
          ]
  }
]

english_grades = grade_book.select {|subj| subj[:subject] == "English"}

english_quizzes = english_grades[0][:grades].select do |grade|
  grade[:type] == "Quiz"
end

english_quiz_scores = english_quizzes.map {|quiz| quiz[:score] }


sum = english_quiz_scores.sum
number = english_quiz_scores.size

p "The average of #{number} English quizzes is #{sum/number.to_f}"
