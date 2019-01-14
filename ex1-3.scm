;;; Exercise 1.3
(define (sum-of-squares x y) (+ (* x x) (* y y)))

(define (get-sum-of-squares-two a b c)
	(cond ((and (< a b) (< a c)) (sum-of-squares b c))
	      ((and (< b a) (< b c)) (sum-of-squares a c))
	      ((and (< c a) (< c b)) (sum-of-squares a b))))

(get-sum-of-squares-two 1 2 3)
(get-sum-of-squares-two 2 3 4)
(get-sum-of-squares-two 6 5 4)
