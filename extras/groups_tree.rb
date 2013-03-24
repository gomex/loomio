class GroupsTree
  include Enumerable

  def initialize(user)
    @user = user
  end

  def self.for_user(user)
    new(user)
  end

  def depth_first_traversal
    each
  end

  def each
    return to_enum unless block_given?
    tree.each do |group_node|
      yield group_node.value unless group_node.root?
    end
  end

  private

  def tree
    root = Tree.new
    root.children = @user.groups.map do |group|
      group_node = Tree.new(parent: root, value: group)
      group_node.children = group.subgroups.map { |subgroup|
                            Tree.new(parent: group_node, value: subgroup) }
      group_node
    end
    root
  end
end