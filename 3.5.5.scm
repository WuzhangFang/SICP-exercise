;; 3.5.5 Modularity of Functional Programs and Modularity of Objects
(load "3.5.scm")

; see the implementation in 3.1.2.scm without stream

(define rand
    (let ((x random-init))
        (lambda () (set! x (rand-update x)) x)))

(define (estimate-pi trials)
    (sqrt (/ 6 (monte-carlo trials cesaro-test))))

(define (cesaro-test)
    (= (gcd (rand) (rand)) 1))

(define (monte-carlo trials experiment)
    (define (iter trials-remaining trials-passed)
        (cond ((= trials-remaining 0) (/ trials-passed trials))
              ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
              (else (iter (- trials-remaining 1) trials-passed))))
    (iter trials 0))

; stream version of Monte-Carlo procedure

(define random-numbers
    (cons-stream random-init
                 (stream-map rand-update
                             random-numbers)))
(define cesaro-stream
    (map-successive-pairs (lambda (r1 r2)
                            (= (gcd r1 r2)1 ))
                          random-numbers))

(define (map-successive-pairs f s)
    (cons-stream
        (f (stream-car s)
           (stream-car (stream-cdr s)))
        (map-successive-pairs
         f (stream-cdr (stream-cdr s)))))

(define (monte-carlo experiment-stream passed failed)
    (define (next passed failed)
        (cons-stream
          (/ passed (+ passed failed))
          (monte-carlo
            (stream-cdr experiment-stream) passed failed)))
    (if (stream-car experiment-stream)
        (next (+ passed 1) failed)
        (next passed (+ failed 1))))

(define pi
    (stream-map (lambda (p) (sqrt (/ 6 p)))
            (monte-carlo cesaro-stream 0 0)))
