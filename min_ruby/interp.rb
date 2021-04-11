require "./minruby"

def evaluate(tree)
    case tree[0]
    when "func_call"
        p(evaluate(tree[2]))
    when "stmts"
        i = 1
        while tree[i] != nil
            evaluate(tree[i])
            i += 1;
        end
    when "lit"
        tree[1]
    when "+"
        evaluate(tree[1]) + evaluate(tree[2])
    when "-"
        evaluate(tree[1]) - evaluate(tree[2])
    when "*"
        evaluate(tree[1]) * evaluate(tree[2])
    when "/"
        evaluate(tree[1]) / evaluate(tree[2])
    when "%"
        evaluate(tree[1]) % evaluate(tree[2])
    when "**"
        evaluate(tree[1]) ** evaluate(tree[2])
    when "=="
        evaluate(tree[1]) == evaluate(tree[2]) ? true : false
    when "!="
        evaluate(tree[1]) != evaluate(tree[2]) ? true : false
    when "<"
        evaluate(tree[1]) < evaluate(tree[2]) ? true : false
    when ">"
        evaluate(tree[1]) > evaluate(tree[2]) ? true : false
    end
end

def max(tree)
    case tree[0]
    when "func_call"
        p(max(tree[2]))
    when "stmts"
        i = 1
        while tree[i] != nil
            max(tree[i])
            i += 1;
        end
    when "lit"
        tree[1]
    else
        max(tree[1]) > max(tree[2]) ? max(tree[1]) : max(tree[2])
    end
end

str = minruby_load()
tree = minruby_parse(str)
evaluate(tree)
max(tree)
