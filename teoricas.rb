# 3) sobre rotas para mostrar um player (não lembro o controller específico;)
get 'players/:id' => 'players#show'
#outra opção seria usar resources
resources 'players', only [:show]
#dessa forma seria criada apenas a rota /players/:id
#na questão tinha a seguinte opção que criaria todas as rotas para um CRUD e uma aplicação REST
resources 'players' #=> que criaria as rotas para os métodos [:index,:show, :update, :create, :destroy]

# 4) Realizazar uma chamada para o banco de dados sem precisar chamar a tabela inteira
#As duas opções que achei validas seriam:
Model.pluck(:id) #=> retornaria uma Array<id>
#poderiamos usar
model = Model.select(:id) #=> Retornaria Um objeto de Active Record Collection com [{:id}, {:id}]
model.map{ |m|m.id } #=> iria trazer a Array de ids
