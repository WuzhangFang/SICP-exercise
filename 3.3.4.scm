;; A simulator for digital circuits
(define a (make-wire))
(define b (make-wire))
(define c (make-wire))
(define d (make-wire))
(define e (make-wire))
(define s (make-wire))
; input signals and output signals
(or-gate a b d)
(and-gate a b c)
(inverter c e)
(and-gate d e s)
(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))
(define (full-adder a b c-in sum c-out)
  (let ((c1 (make-wire)) 
	(s (make-wire))	
	(c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))
;; (get-signal <wire>) returns the current value of the signal on the wire
;; (set-signal! <wire> <new-value>) changes the value of the signal on the wire to the new value
;; (add-action! <wire> <procedure of no arguments>)
(define (inverter input output)
  (define (invert-input)
    (let ((new-value
	    (logical-not (get-signal input))))
      (after-delay inverter-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)

(define (logical-not s)
  (cond ((= s 0) 1)
	 ((= s 1) 0)
	 (else (error "Invaid signal" s))))

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
	    (logical-and (get-signal a1)
			 (get-signal a2))))
      (after-delay and-gate-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)
