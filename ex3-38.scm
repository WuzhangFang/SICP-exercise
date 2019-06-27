;; Exercise 3.38
;; Peter: (set! balance (+ balance 10))
;; Paul: (set! balance (- balance 20))
;; Mary: (set! balance (- balance (/ balance 2)))
;; initially: 100
;; 
;; (1) sequential
;; Peter (110) -> Paul (90) -> Mary (45)
;; Peter (110) -> Mary (55) -> Paul (35)
;; Paul (80) -> Mary (40) -> Peter (50)
;; Paul (80) -> Peter (90) -> Mary (45)
;; Mary (50) -> Peter (60) -> Paul (40)
;; Mary (50) -> Paul (30) -> Peter (40)
;; (2) interleaved
;;            
;;  Peter (90) 
;;  Mary (50) inbetween
;;  Paul (30)
