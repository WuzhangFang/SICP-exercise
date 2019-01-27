;; Exercise 3.9
;;
;;                 +----------------------+
;; global env ---> |                      |
;;                 | factorial ----+      |
;;                 +---------------|------+ 
;;                                 |    ^   
;;                                 |    |
;;                              [O][O]--+
;;                               |
;;                               v
;;                        parameter: n
;;                        body:
;;                            (if (= n 1)
;;                                1
;;                                (* n (factorial (- n 1))))
