## [ArgumentError] Retornar erro caso adicionar sub categoria que já exista na tree
## [ArgumentError] Retornar erro caso adicionar uma categoria pai não seja informada, 

## Adicionar Categoria Pai caso parent seja nil
## Adicionar SubCategoria a categoria Pai caso parent tenha valor
class CategoryTree
    attr_reader :categories

    def initialize
        @categories = Hash.new
    end

    def add_category(category, parent)
        raise ArgumentError if ((!parent.nil? && !@categories.key?(parent)) || @categories.flatten.any?(category)) 
        parent.nil? ? @categories[category] = [] : @categories[parent] << category 
    end

    def get_children(parent_category)
        @categories[parent_category]
    end
end

c = CategoryTree.new
c.add_category('A', nil)
c.add_category('B', 'A')
c.add_category('C', 'A')
puts (c.get_children('A') || []).join(',')
