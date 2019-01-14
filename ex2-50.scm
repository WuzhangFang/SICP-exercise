;;; Exercise 2.50
(define (flip-horiz painter)
    (transform-painter painter
                       (0.0 1.0)
                       (0.0 0.0)
                       (1.0 1.0)))
