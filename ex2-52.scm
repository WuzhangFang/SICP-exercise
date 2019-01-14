;;; Exercise 2.52
(define (square-limit-2 painter n)
    (let ((combine4
                (square-of-four identity
                                flip-horiz
                                flip-vert
                                rotate180)))
        (combine4 (corner-split painter n))))
