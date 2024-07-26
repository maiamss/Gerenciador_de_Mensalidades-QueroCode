module V1
  class StudentsController < ApplicationController

    
  # GET /students    
    def index
      page = (params[:page] || 1).to_i
      per_page = (params[:count] || 10).to_i
      offset = (page - 1) * per_page
    
      students = Student.limit(per_page).offset(offset)

      render json: {
        page: page,
        items: students.map do |student|
          {
            id: student.id,
            name: student.name,
            cpf: student.cpf,
            birthdate: student.birthdate.strftime("%d/%m/%Y"),
            payment_method: student.payment_method
          }
        end
      }
    end 
    
      # POST /students
    def create
      @student = Student.new(student_params)
      if @student.save
        render json: { id: @student.id }, status: :created
      else
        render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def student_params
      params.require(:student).permit(:name, :cpf, :birthdate, :payment_method)
    end

  end
end