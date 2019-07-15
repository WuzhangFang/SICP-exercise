;; Exercise 3.47
;; a. in terms of mutexes
(define (make-semaphore n)
  (let ((mutex (make-mutex))
	(count 0))
    (define (acquire)
      (mutex 'acquire)
      (cond ((< count n)
	     (set! count (+ count 1))
	     (mutex 'release))
	    (else
	      (mutex 'release)
	      (acquire))))
    (define (release)
      (mutex 'acquire)
      (if (<= 1 count)
	(set! count (- count 1))
	(error "not acquired"))
      (mutex 'release))
    (define (dispatch m)
      (cond ((eq? m 'acquire) (acquire))
	    ((eq? m 'release) (release))
	    (else (error "unknown"))))
    dispatch))
;; b. in terms of atomic test-and-set! operations
(define (make-semaphore n)
  (let ((cell (list false))
	(count 0))
    (define (acquire)
      (if (test-and-set! cell)
	(acquire)
	(cond ((< count n)
	       (set! count (+ count 1))
	       (clear! cell))
	      (else
		(clear! cell)
		(acquire)))))
    (define (release)
      (cond ((test-and-set! cell)
	     (release))
	    (else
	      (if (< 1 count)
		(set! count (- count 1))
		(error "not acquired"))
	      (clear! cell))))
    (define (dispatch m)
      (cond ((eq? m 'acquire) (acquire))
	    ((eq? m 'release) (release))
	    (else (error "unknown"))))
    dispatch))

