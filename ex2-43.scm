;;; Exercise 2.43
; Louis Reasoner's version of eight-queens problem
(load "sequence-operations.scm")
; the difference is that in Louis's version, the (queen-cols (- k 1)) will be performed
; board-size times, while in the original version, it will be performed once.
(define (queens board-size)
    (define (queen-cols k)
        (if (= 0 k)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap 
                    (lambda (new-row)
                        (map (lambda (rest-of-queens)
                                (adjoin-position new-row k rest-of-queens))
                             (queen-cols (- k 1))))
                    (enumerate-interval 1 board-size)))))
    (queen-cols board-size))                               

(define empty-board `())

; use a pair (row, col) to represent the position
; put the k_th position in front of k-1_th positions
(define (make-position row col)
    (cons row col))

(define (position-row position)
    (car position))

(define (position-col position)
    (cdr position))

(define (adjoin-position new-row k rest-of-queens)
    (append (list (make-position new-row k)) rest-of-queens))

(define (safe? k positions)
    (let ((k-th (car positions))
          (rest-positions (cdr positions)))
        (define (iter rest-positions)
            (cond ((null? rest-positions) #t)
                  ((= (position-row k-th) (position-row (car rest-positions))) #f)
                  ((= (abs (- (position-row k-th) (position-row (car rest-positions))))
                      (abs (- k (position-col (car rest-positions))))) #f)
                  (else (iter (cdr rest-positions)))))
        (iter rest-positions)))

(length (queens 2))
