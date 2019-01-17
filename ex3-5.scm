;; Exercise 3.5 Monte Carlo integration
(load "3.1.2.scm")

(define (random-in-range low high)
    (let ((range (- high low)))
        (+ low (random range))))

(define (estimate-integral trials P x1 x2 y1 y2)
    (* (* (abs (- x1 x2)) (abs (- y1 y2))) (monte-carlo trials P)))

(define (circle)
    (>= 1 (+ (square (random-in-range -1.0 1.0))
             (square (random-in-range -1.0 1.0)))))

(estimate-integral 1000000 circle -1.0 1.0 -1.0 1.0)
