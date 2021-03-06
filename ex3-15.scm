;; Exercise 3.15
(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))
(define (set-to-wow! x)
    (set-car! (car x) 'wow)
    x)
(set-to-wow! z1)
(set-to-wow! z2)
; box-and-pointer diagram
; z1: [*][*]
;      |  |
;      v  v 
;  x: [*][*]-->[*]['()]
;      |        |
;      v        v
;     'a       'b  
; (set-to-wow! z1)
; z1: [*][*]
;      |  |
;      v  v 
;  x: [*][*]-->[*]['()]
;      |        |
;      v        v
;    'wow      'b  
; z2: [*][*]-->[*][*]-->[*]['()]
;      |        |        |
;      |        v        v
;      |       'a       'b          
;      |        ^        ^
;      |        |        |
;      +------>[*][*]-->[*]['()]
; (set-to-wow! z2)
; z2: [*][*]-->[*][*]-->[*]['()]
;      |        |        |
;      |        v        v
;      |       'a       'b          
;      |      'wow      'b
;      |        ^        ^
;      |        |        |
;      +------>[*][*]-->[*]['()]
