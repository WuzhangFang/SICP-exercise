;; Apply-generic looks in the table under the name of operation
;; and the types of the arguments and applies the resulting 
;; procedure if one is present:
(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op types)))
            (if proc
                (apply proc (map contents args))
                (error 
                    "No method for these types:
                    APPLY-GENERIC"
                (list op types))))))
