;;; Exercise 1.27
; Carmichael numbers: 561, 1105, 1729, 2465, 2821, 6601
(load "expmod.scm")

(define (carmichael-test n)
    (iter 1 n))

(define (iter a n)
    (cond ((= a n) true)
          ((try-it a n) (iter (+ 1 a) n))
          (else false)))

(define (try-it a n) (= (expmod a n n) a))

(carmichael-test 100)
(carmichael-test 561)
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2465)
(carmichael-test 2821)
(carmichael-test 6601)

