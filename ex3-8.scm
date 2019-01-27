;; Exercise 3.8
;; return 0 if + evaluated from left to right
;; return 1 if + evaluated from right to left
;; adoped from http://community.schemewiki.org/?sicp-ex-3.8
(+ (f 0) (f 1))
(define f
    (let ((count 1))
        (lambda (x)
            (set! count (* count x))
            count)))
