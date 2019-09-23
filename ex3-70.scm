;; Exercise 3.70
;; generating pairs in some useful order
;; 
(load "3.5.scm")
(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
          (let ((s1car (stream-car s1))
                (s2car (stream-car s2)))
            (cond ((< s1car s2car)
                   (cons-stream
                    s1car
                   (merge (stream-cdr s1) s2)))
                  ((> s1car s2car)
                   (cons-stream
                    s2car
                   (merge s1 (stream-car s2))))
                  (else
                    (cons-stream
                     s1car
                     (merge (stream-cdr s1)
                            (stream-cdr s2)))))))))
;; modified merge with weighting funtion
(define (merge-weighted s1 s2 weight)
  (cond
    ((stream-null? s1) s2)
    ((stream-null? s2) s1)
    (else 
        (let ((s1car (stream-car s1))
              (s2car (stream-car s2)))
            (if (> (weight s1car) (weight s2car))
                (cons-stream s2car (merge-weighted s1 (stream-cdr s2) weight))
                (cons-stream s1car (merge-weighted (stream-cdr s1) s2 weight)))))))
;; modified pairs: use merged-weighted instead of interleave
(define (weighted-pairs s t weight)
  (cons-stream 
    (list (stream-car s) (stream-car t))
    (merge-weighted
      (stream-map (lambda (x) (list (stream-car s) x))
                  (stream-cdr t))
      (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
      weight)))
;; a. 
; weighting function: i + j
(weighted-pairs integers integers (lambda (pair) (+ (car pair) (cadr pair))))
;; b.
(define not235
    (stream-filter (lambda (x) (and (not (= (remainder x 2) 0))
                                    (not (= (remainder x 3) 0))
                                    (not (= (remainder x 5) 0))))
                   integers))
; weighting function: 2i + 3j + 5ij
(weighted-pairs not235 not235 (lambda (pair) (+ (* 2 (car pair)) (* 3 (cadr pair)) (* 5 (car pair) (cadr pair)))))
(show-stream not235 5)
