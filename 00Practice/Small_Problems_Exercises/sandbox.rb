GRADE_CUTOFFS = (6..10).to_a.reverse
GRADES = %w(A A B C D)
GRADE_BOOK = GRADE_CUTOFFS.zip(GRADES).to_h

def get_grade(*scores)
  average = scores.sum / scores.size
  GRADE_BOOK[average / 10] || 'F'
end
