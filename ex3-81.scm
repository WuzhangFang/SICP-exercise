;; Exercise 3.81
(load "3.5.scm")
;;; Exercise 3.6
(define (rand-update x)
    (let ((m 127)
          (a 32)
          (b 28))
        (modulo (+ (* a x) b) m)))
;
;(define rand
;    (let ((x 0))
;        (define (generate)
;            (set! x (rand-update x)) x)
;        (define (reset n)
;            (set! x n))
;        (define (dispatch m)
;            (cond ((eq? m 'generate) (generate))
;                  ((eq? m 'reset) reset)
;                  (else (error "no such method" m))))
;dispatch))
;
;; stream version
;; let the requests be a stream of number and 'generate
;; https://github.com/kana/sicp/blob/master/ex-3.81.scm
(define (rand requests)
    (define (generate-random-numbers seed)
        (define random-numbers
            (cons-stream seed
                         (stream-map rand-update random-numbers)))
    random-numbers)
    (define (dispatch requests numbers)
        (let ((r (stream-car requests)))
            (cond ((eq? r 'generate)
                   (process requests numbers))
                  ((number? r)
                   (process requests (stream-cdr (generate-random-numbers r)))))))
    (define (process requests numbers)
        (cons-stream
            (stream-car numbers)
            (dispatch (stream-cdr requests) (stream-cdr numbers))))
    (define random-seed 0)
    (dispatch requests (generate-random-numbers random-seed)))

; test
(rand-update 0)
(rand-update 1)
(rand-update 2)
(rand-update 3)
(rand-update (rand-update 3))
(rand-update 124)
