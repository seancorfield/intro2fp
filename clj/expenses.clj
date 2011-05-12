; expenses inspired by examples in Clojure in Action by Amit Rathore
(def the-expenses 
  [{:amount 10.0 :merchant "Amazon" :category "Book" :user "Sean"}
   {:amount 20.0 :merchant "Amazon" :category "Toy" :user "Gert"}
   {:amount 30.0 :merchant "Burger King" :category "Meal" :user "Mark"}
   {:amount 40.0 :merchant "Ubuntu" :category "Software" :user "Peter"}
   {:amount 50.0 :merchant "Sephora" :category "Cosmetics" :user "Micha"}
   {:amount 60.0 :merchant "French Laundry" :category "Meal" :user "Sean"}
   {:amount 70.0 :merchant "Lynda" :category "School" :user "Gert"}
   {:amount 80.0 :merchant "Apple" :category "Software" :user "Mark"}
   {:amount 90.0 :merchant "Powells" :category "Book" :user "Peter"}
   {:amount 100.0 :merchant "Apple" :category "Software" :user "Micha"}
   {:amount 110.0 :merchant "Barnes & Noble" :category "Book" :user "Sean"}
   {:amount 120.0 :merchant "Toys'r'Us" :category "Toy" :user "Gert"}])

(defn find-by-key [data k v] 
  (filter (fn [m] (= v (m k))) data))

; find all Apple purchases
(find-by-key the-expenses :merchant "Apple")

; who bought Apple?
(map :user (find-by-key the-expenses :merchant "Apple"))

; total Apple purchases
(reduce + (map :amount (find-by-key the-expenses :merchant "Apple")))

(defn total-by-key [data k v]
  (reduce + (map :amount (find-by-key data k v))))

; all merchants?
(map :merchant the-expenses)

; all distinct merchants!
(distinct (map :merchant the-expenses))

(defn unique-by-key [data k]
  (distinct (map k data)))

(defn expense-report 
  [data k]
    (map (fn [v]
           {k v :total (total-by-key data k v)}) 
         (unique-by-key data k)))

(do (println "Expenses by Merchant") 
  (expense-report the-expenses :merchant))
(do (println "Expenses by User") 
  (expense-report the-expenses :user))
(do (println "Expenses by Category") 
  (expense-report the-expenses :category))

(defn richest [k]
  (last 
    (sort-by :total 
             (expense-report the-expenses k))))

(richest :merchant)
(richest :user)
(richest :category)

; find-by-key = filter
; total-by-key = reduce / map / find-by-key
; unique-by-key = distinct / map
; expense-report = map / total-by-key / unique-by-key
; richest = last / sort-by / expense-report

(defn tax-adjust [rate] (+ 1 (/ rate 100.0)))
(def *tax-rate* 8.5)
(defn less-tax [amt] (/ amt (tax-adjust *tax-rate*)))

;;
(comment
  (defn expense-report 
    ([data k] (expense-report data k identity))
    ([data k adjust]
      (map (fn [v]
             {k v :total (adjust (total-by-key data k v))}) 
           (unique-by-key data k))))
  (do (println "Expenses by Merchant less tax") 
    (expense-report the-expenses :merchant less-tax))
  (defmacro with-tax-rate [n & body]
    `(binding [*tax-rate* ~n] (doall ~@body)))
  (do (println "Expenses by Merchant less 0% tax") 
    (with-tax-rate 0 (expense-report the-expenses :merchant less-tax)))
  (do (println "Expenses by Merchant less 100% tax") 
    (with-tax-rate 100 (expense-report the-expenses :merchant less-tax))))
;;

(println "Expenses example loaded!")