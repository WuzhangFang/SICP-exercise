;; Exercise 3.23
;; build a deque using local state
;; front-ptr serves as a queue as well
;; in the (rear-delete-deque!), it uses a iteration to run over the queue
;; it is not efficient, but it can be solved using another queue to record
;; inversely which is not done here
(define (make-deque)
    (let ((front-ptr '())
          (rear-ptr '()))
        (define (empty-deque?) ; unchanged
            (null? front-ptr))
        (define (front-insert-deque! item)
          (let ((new-pair (cons item '())))
            (cond ((empty-deque?)
                        (set! front-ptr new-pair)
                        (set! rear-ptr new-pair)
                        front-ptr)
                   (else
                        (set-cdr! new-pair front-ptr)
                        (set! front-ptr new-pair)
                        front-ptr))))
        (define (rear-insert-deque! item) ; unchanged
          (let ((new-pair (cons item '())))
            (cond ((empty-deque?)
                        (set! front-ptr new-pair)
                        (set! rear-ptr new-pair)
                        front-ptr)
                   (else
                        (set-cdr! rear-ptr new-pair)
                        (set! rear-ptr new-pair)
                        front-ptr))))
        (define (front-delete-deque!) ; unchanged
            (cond ((empty-deque?)
                    (error "DELETE! called with an empty queue" front-ptr))
                  (else
                    (set! front-ptr (cdr front-ptr))
                    front-ptr)))
        (define (rear-delete-deque!)
            (define (iter q lst)
                (cond ((null? (cddr lst))
                        (set-cdr! lst '())
                        (set! rear-ptr lst)
                        front-ptr)
                      (else (iter q (cdr lst)))))
            (cond ((empty-deque?)
                    (error "DELETE! called with an empty queue" front-ptr))
                  (else (iter front-ptr front-ptr))))
        (define (dispatch m)          ; unchanged
            (cond ((eq? m 'empty-deque?) empty-deque?)
                  ((eq? m 'front-insert-deque!) front-insert-deque!)
                  ((eq? m 'rear-insert-deque!) rear-insert-deque!)
                  ((eq? m 'front-delete-deque!) front-delete-deque!)
                  ((eq? m 'rear-delete-deque!) rear-delete-deque!)
                  (else (error "Unknown operation for queue"))))
dispatch))
;; test
(define q (make-deque))
((q 'front-insert-deque!) 'a)
((q 'front-insert-deque!) 'b)
((q 'front-insert-deque!) 'c)
((q 'rear-insert-deque!) 'c)
((q 'rear-insert-deque!) 'd)
((q 'front-delete-deque!))
((q 'rear-delete-deque!))
