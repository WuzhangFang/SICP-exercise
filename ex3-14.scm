;; Exercise 3.14
(define (mystery x)
    (define (loop x y)
        (if (null? x)
            y
            (let ((temp (cdr x)))
                (set-cdr! x y)
                (loop temp x))))
    (loop x '()))
; test 
(define v (list 'a 'b 'c))
(define w (mystery v))
v
w
; box-and-pointer diagram
;
; v: [*][*]----->[*][*]----->[*][*]----->'()
;     |           |           |
;     v           v           v
;    'a          'b          'c
;
; (loop (list 'a 'b 'c) '())
; (let ((temp (list 'b 'c)))
;   (set-cdr! (list 'a 'b 'c) '())
;   (loop (list 'b 'c) (list 'a)))
;
; (loop (list 'b 'c) (list 'a))
; (let ((temp (list 'c)))
;   (set-cdr! (list 'b 'c) (list 'a))
;   (loop (list 'c) (list 'b 'a)))
;
; (loop (list c) (list 'b 'a))
; (let ((temp '()))
;   (set-cdr! (list 'c) (list 'b 'a))
;   (loop '() (list 'c 'b 'a)))
;
; (loop '() (list 'c 'b 'a)))
; (list 'c 'b 'a)
;
