;; Exercise 3.30
(define (ripple-carry-adder lst-A lst-B lst-S C)
  (define (iter A B S c-in c-out)
    (if (null? A)
      S
    (begin (full-adder (car A) (car B) c-in (car S) c-out)
           (iter (cdr A) (cdr B) (cdr S) c-out (make-wire)))))
  (iter lst-A lst-B lst-S C (make-wire)))
;; use the c-out as an input of next full-adder
