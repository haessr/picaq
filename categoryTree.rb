class CategoryNode
  attr_accessor :name, :parent, :children
  def initialize(name, parent)
    @name = name
    @parent = parent
    @children = []
  end

  def to_s
    @name
  end
end

class CategoryTree
  @@root = nil
  @@categorie_nodes = []

  def add_category(category, parent)
    # @@categorie_nodes[name] = { parent: parent, children: []}
    # @@root ||= category_node if parent.nil?

    parent_categorie = @@categorie_nodes.find { |cn| cn.name == parent}
    existing_categorie = @@categorie_nodes.find { |cn| cn.name == category}
    if @@root != nil
      raise ArgumentError unless parent_categorie
    end
    raise ArgumentError if existing_categorie

    category_node = CategoryNode.new(category, parent)

    @@root ||= category_node if parent.nil?
    @@categorie_nodes << category_node

    if parent_categorie
      parent_categorie.children << category_node
    end
  end

  def get_children(category)
    return @@categorie_nodes.find { |cn| cn.name == category}.children
  end

end

c = CategoryTree.new
c.add_category('A', nil)
c.add_category('B', 'A')
c.add_category('C', 'A')
puts (c.get_children('A') || []).join(',')

c.add_category('C', 'Z')
