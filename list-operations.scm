;;; List operations
; list-ref, append, length, reverse
(define (count-leaves x)
    (cond ((null? x) 0)
          ((not (pair? x)) 1)
          (else (+ (count-leaves (car x)) (count-leaves (cdr x))))))

(define (fringe x)
        (cond ((null? x) (list))
              ((not (pair? x)) (list x))
              (else (append (fringe (car x)) (fringe (cdr x))))))

(define (deep-reverse lst)
    (define (reverse-iter rest result)
        (cond ((null? rest) result)
              ((pair? (car rest)) (reverse-iter (cdr rest) (cons (reverse (car rest)) result)))
              (else (reverse-iter (cdr test) (cons (car rest) result)))))
    (reverse-iter lst (list)))
(count-leaves (list 1 (list 3 4) 5))
