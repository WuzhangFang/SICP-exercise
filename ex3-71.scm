;; Exercise 3.71
(load "ex3-70.scm")
(load "3.5.scm")

(define (cube x)
  (* x x x))

(define (weight pair)
    (+ (cube (car pair)) (cube (cadr pair))))

(define p (weighted-pairs integers integers weight))

(define (generate-ramanujan-number pairs)
  (let ((first (stream-car pairs))
        (second (stream-car (stream-cdr pairs)))) ; consecutive pairs
    (if (= (weight first) (weight second))
      (cons-stream (weight first)
        (generate-ramanujan-number (stream-cdr pairs)))
      (generate-ramanujan-number (stream-cdr pairs)))))

(define ramanujan-number (generate-ramanujan-number p))

; test
(show-stream ramanujan-number 5)

;----------------------------------------------------
;1 ]=> (show-stream ramanujan-number 5)
;1729
;4104
;13832
;20683
;32832
;done
;;Unspecified return value

;http://oeis.org/wiki/Hardy%E2%80%93Ramanujan_numbers
