require "./minruby"

def evaluate(tree)
    case tree[0]
    when "lit"
        tree[1]
    when "+"
        left  = evaluate(tree[1])
        right = evaluate(tree[2])
        left + right
    when "-"
        left  = evaluate(tree[1])
        right = evaluate(tree[2])
        left - right
    when "*"
        left  = evaluate(tree[1])
        right = evaluate(tree[2])
        left * right
    when "/"
        left  = evaluate(tree[1])
        right = evaluate(tree[2])
        left / right
    when "%"
        left  = evaluate(tree[1])
        right = evaluate(tree[2])
        left % right
    when "**"
        left  = evaluate(tree[1])
        right = evaluate(tree[2])
        left ** right
    when "=="
        left  = evaluate(tree[1])
        right = evaluate(tree[2])
        if left == right
            true
        else
            false
        end
    when "!="
        left  = evaluate(tree[1])
        right = evaluate(tree[2])
        if left != right
            true
        else
            false
        end
    when "<"
        left  = evaluate(tree[1])
        right = evaluate(tree[2])
        if left < right
            true
        else
            false
        end
    when ">"
        left  = evaluate(tree[1])
        right = evaluate(tree[2])
        if left > right
            true
        else
            false
        end
    end
end

def max(tree)
    if(tree[0] == "lit")
        tree[1]
    else
        left  = max(tree[1])
        right = max(tree[2])
        if left > right
            left
        else
            right
        end
    end
end

str = gets
tree = minruby_parse(str)

p(tree)

answer = evaluate(tree)
max_value = max(tree)

p(answer)
p(max_value)
