(def v [1 2 3 4 5])

(map inc v)

(map (comp inc inc) v)

(reduce + v)

(filter even? v)

(filter (complement even?) v)

(map (partial + 10) v)
