;; Exercise 3.82
(load "3.5.5.scm")
;; Exercise 3.5 Monte Carlo integration
;(load "3.1.2.scm")
;
;(define (random-in-range low high)
;    (let ((range (- high low)))
;        (+ low (random range))))
;
;(define (estimate-integral trials P x1 x2 y1 y2)
;    (* (* (abs (- x1 x2)) (abs (- y1 y2))) (monte-carlo trials P)))
;
;(define (circle)
;    (>= 1 (+ (square (random-in-range -1.0 1.0))
;             (square (random-in-range -1.0 1.0)))))
;
;(estimate-integral 1000000 circle -1.0 1.0 -1.0 1.0)

; stream version
; assume low-range and high-range are -1.0 and 1.0.
(define random-in-range
    (cons-stream (random-in-range -1.0 1.0)
        random-in-range))

(define circle
    (map-successive-pairs (lambda (x y)
                            (>= 1 (square x)
                                  (square y)))
                          random-in-range))

(define (estimate-integral P x1 x2 y1 y2)
    (let ((area (* (* (abs (- x1 x2)) (abs (- y1 y2))))))
         (scale-stream (monte-carlo P 0 0) area)))
