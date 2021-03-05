# Artist
bob_ross = Teacher.find_or_create_by(email: 'bob.ross@online-teachers.com')
picasso = Teacher.find_or_create_by(email: 'pablo.picasso@online-teachers.com')
davinci = Teacher.find_or_create_by(email: 'leonardo.davinci@online-teachers.com')

# Courses
joy_of_painting = Course.find_or_create_by(title: 'The joy of painting')
cubism = Course.find_or_create_by(title: 'How to interpret cubism')
jack_of_all_trades = Course.find_or_create_by(title: 'Mastering jack of all trades')

# Proposed courses
ProposedCourse.find_or_create_by(teacher: bob_ross, course: joy_of_painting)
ProposedCourse.find_or_create_by(teacher: picasso, course: cubism)
ProposedCourse.find_or_create_by(teacher: davinci, course: jack_of_all_trades)