class StudentsController < ApplicationController
  def index
    students = Student.all
    render json: students
  end
  def grades
    students = Student.order(grade: :desc)
    render json: students
  end
  def highest_grade
    student = Student.order(grade: :desc).first
    render json: student
  end
  def lowest_grade
    student = Student.order(grade: :desc).last
    render json: student
  end
  def mean_grade
    students = Student.all
    total_grade = students.sum(:grade)
    
    if students.count > 0
      mean = total_grade.to_f / students.count
    else
      mean = 0
    end

    render json: { mean_grade: mean }
  end
end
