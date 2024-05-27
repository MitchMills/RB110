GRADE_RANGES = [(90..100), (80..89), (70..79), (60..69), (0..59)]
GRADES = %w(A B C D F)
GRADE_BOOK = GRADE_RANGES.zip(GRADES).to_h

def get_grade(score1, score2, score3)
  average = [score1, score2, score3].sum / 3.0
  GRADE_BOOK.each { |range, grade| return grade if range.include?(average) }
end
