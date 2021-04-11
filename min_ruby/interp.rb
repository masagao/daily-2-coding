require "./minruby"

def evaluate(tree, genv, lenv)
    case tree[0]
    when "func_call"
        args = []
        i = 0
        while tree[i + 2]
            args[i] = evaluate(tree[i + 2], genv, lenv)
            i += 1
        end
        mhd = genv[tree[1]]
        if mhd[0] == "builtin"
            minruby_call(mhd[1], args)
        else

        end
    when "stmts"
        i = 1
        while tree[i]
            evaluate(tree[i], genv, lenv)
            i += 1
        end
    when "var_assign"
        lenv[tree[1]] = evaluate(tree[2], genv, lenv)
    when "var_ref"
        lenv[tree[1]]
    when "if"
        evaluate(tree[1], genv, lenv) ? evaluate(tree[2], genv, lenv) : evaluate(tree[3], genv, lenv)
    when "while"
        while evaluate(tree[1], genv, lenv)
            evaluate(tree[2], genv, lenv)
        end
    when "while2"
        evaluate(tree[2], genv, lenv)
        while evaluate(tree[1], genv, lenv)
            evaluate(tree[2], genv, lenv)
        end
    when "lit"
        tree[1]
    when "+"
        evaluate(tree[1], genv, lenv) + evaluate(tree[2], genv, lenv)
        lenv["plus_count"] += 1
    when "-"
        evaluate(tree[1], genv, lenv) - evaluate(tree[2], genv, lenv)
    when "*"
        evaluate(tree[1], genv, lenv) * evaluate(tree[2], genv, lenv)
    when "/"
        evaluate(tree[1], genv, lenv) / evaluate(tree[2], genv, lenv)
    when "%"
        evaluate(tree[1], genv, lenv) % evaluate(tree[2], genv, lenv)
    when "**"
        evaluate(tree[1], genv, lenv) ** evaluate(tree[2], genv, lenv)
    when "=="
        evaluate(tree[1], genv, lenv) == evaluate(tree[2], genv, lenv) ? true : false
    when "!="
        evaluate(tree[1], genv, lenv) != evaluate(tree[2], genv, lenv) ? true : false
    when "<"
        evaluate(tree[1], genv, lenv) < evaluate(tree[2], genv, lenv) ? true : false
    when ">"
        evaluate(tree[1], genv, lenv) > evaluate(tree[2], genv, lenv) ? true : false
    when "<="
        evaluate(tree[1], genv, lenv) <= evaluate(tree[2], genv, lenv) ? true : false
    when ">="
        evaluate(tree[1], genv, lenv) >= evaluate(tree[2], genv, lenv) ? true : false
    when "&&"
        evaluate(tree[1], genv, lenv) && evaluate(tree[2], genv, lenv) ? true : false
    else
        pp(tree)
    end
end

str = minruby_load()
tree = minruby_parse(str)

pp(tree)

genv = {
    "p" => ["builtin", "p"],
    "add" => ["builtin", "add"],
    "fizzBuzz" => ["builtin", "fizzBuzz"]
}

lenv = {"plus_count" => 0}

evaluate(tree, genv, lenv)
