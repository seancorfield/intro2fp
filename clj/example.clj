(def v [1 2 3 4 5])

(map inc v)

(reduce + v)

(filter even? v)

(map (comp inc inc) v)

(filter (complement even?) v)

(map (partial + 10) v)

((partial map inc) v)
