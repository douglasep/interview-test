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
        raise ArgumentError.new('Infelizmente esta categoria já existe') if (@categories.values.flatten.any?(category) || @categories.keys.flatten.any?(category)) 
        raise ArgumentError.new('Por favor insira uma sub categoria válida') if (!parent.nil? && category.nil?) 
        # parent.nil? ? @categories[category] = [] : dig.call(@categories,parent)
        dig_add = -> (hash, parent_key, category) do
            return hash[parent_key] << {category => []}  if hash.keys.any?(parent_key)
            hash.each do |k,v|
            	dig.call(key, parent_key, category)
            end
        end
        parent.nil? ? @categories[category] = [] : dig_add.call(@categories, parent, category)
        # parent.nil? ? @categories[category] = [] : @categories[parent] << {category => []} 
    end

    def get_children(parent_category)
        dig = -> (hash, key) do
            return nil if !hash.is_a?(Hash)
            return hash[key].collect {|k| k.keys}.flatten if hash.keys.any?(parent_category)
            hash.each do |k,v|
                dig.call(v, parent_category)
            end
        end
        children = dig.call(@categories, parent_category)
    end
end

c = CategoryTree.new
c.add_category('A', nil)
c.add_category('B', 'A')
c.add_category('C', 'A')
# c.add_category(nil, 'A')
# c.add_category('A', nil)
# c.add_category('C', 'A')
puts (c.get_children('A') || []).join(',')
