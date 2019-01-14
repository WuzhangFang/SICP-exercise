;; implement frames
; origin, edge1, and edge2 are vectors
(define (make-frame origin edge1 edge2)
    (list origin edge1 edge2))
(define (origin-frame frame)
    (car frame))
(define (edge1-frame frame)
    (cadr frame))
(define (edge2-frame frame)
    (caddr frame))
