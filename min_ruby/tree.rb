def preorder(tree)
    if tree[0].start_with?("葉")
        p(tree[0])
    end
    if tree[0].start_with?("節")
        preorder(tree[1])
        preorder(tree[2])
    end
end

node = ["節1", ["節2", ["葉A"], ["葉B"]], ["節3", ["葉C"], ["葉D"]]]

preorder(node);
