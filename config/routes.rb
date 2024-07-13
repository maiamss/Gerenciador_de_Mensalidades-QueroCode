Rails.application.routes.draw do
  namespace 'v1' do
  
    # Rota para listar todos os alunos
    get "/students", to: "students#index"
    
    # Rota para cadastrar um novo aluno
    post "/students", to: "students#create"
    
  end
end
