;;; 2.2.4 Example: A Picture Language
(define (flipped-pairs painter)
    (let ((painter2 (beside painter 
                                (flip-vert painter))))
     (below painter2 painter2)))

(define wave4 (flipped-pairs wave))

(define (right-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (right-split painter (- n 1))))
            (beside painter 
                        (below smaller smaller)))))

(define (up-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (up-split painter (- n 1))))
            (above painter 
                        (beside smaller smaller)))))

(define (corner-split painter n)
    (if (= n 0)
        painter
        (let ((up (up-split painter (- n 1)))
              (right (right-split painter (- n 1))))
            (let ((top-left (beside up up))
                  (bottom-right (below right right))
                  (corner (corner-split painter (- n 1))))
                (beside (below painter top-left)
                        (below bottom-right corner))))))

(define (square-limit-1 painter n)
    (let ((quarter (corner-split painter n)))
        (let ((half (beside (flip-horiz quarter) quarter)))
            (below (flip-vert half) half))))
;; High-order operations
; painter is the argument of square-of-four
(define (square-of-four tl tr bl br)
    (lambda (painter) 
        (let ((top (beside (tl painter)
                           (tr painter)))
              (bottom (beside (bl painter)
                              (br painter))))
             (below bottom top))))

(define (square-limit-2 painter n)
    (let ((combine4 
                (square-of-four flip-horiz
                                identity
                                rotate180
                                flip-vert)))
        (combine4 (corner-split painter n))))
;; Frames
; The map transforms the unit square into the frame by mapping the vector v=(x,y)
; to the vector sum: origin(frame) + x*edge1-frame + y*edge2-frame
(define (frame-coord-map frame)
    (lambda (v)
        (add-vect 
            (origin-frame frame)
            (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
                      (scale-vect (ycor-vect v) (edge2-frame frame))))))
;; implement the vector representation
; constructor
(define (make-vect x y)
    (cons x y))
; selectors
(define (xcor-vect vect)
    (car vect))
(define (ycor-vect vect)
    (cdr vect))
; procedures: add-vect, sub-vect, scale-vect
(define (add-vect vect1 vect2)
    (make-vect 
        (+ (xcor-vect vect1) (xcor-vect vect2))
        (+ (ycor-vect vect1) (ycor-vect vect2))))
(define (sub-vect vect1 vect2)
    (make-vect 
        (- (xcor-vect vect1) (xcor-vect vect2))
        (- (ycor-vect vect1) (ycor-vect vect2))))
(define (scale-vect s vect)
    (make-vect 
        (* s (xcor-vect vect))
        (* s (ycor-vect vect))))
;; frames
; origin, edge1, and edge2 are vectors
(define (make-frame origin edge1 edge2)               
    (list origin edge1 edge2))
(define (origin-frame frame)
    (car frame))
(define (edge1-frame frame)
    (cadr frame))
(define (edge2-frame frame)
    (caddr frame))              
;; painters
; draw-line draws a line between two points
(define (segments-painter segment-list)
    (lambda (frame)
        (for-each
            (lambda (segment)
                (draw-line ((frame-coord-map frame) (start-segment segment))
                           ((frame-coord-map frame) (end-segment segment))))
             segment-list))) 
;; segment
; make-segment takes two vectors as arguments
(define (make-segment start-segment end-segment)
    (list start-segment end-segment))
(define (start-segment segment)
    (car segment))
(define (end-segment segment)
    (cadr segment))
;; transforming and combining painters
(define (transform-painter painter origin corner1 corner2)
    (lambda (frame)
        (let ((m (frame-coord-map frame)))
            (let ((new-origin (m origin)))
                (painter (make-frame new-origin
                                     (sub-vect (m corner1) new-origin)
                                     (sub-vect (m corner2) new-origin)))))))
(define (flip-vert painter)
    (transform-painter (make-vect 0.0 1.0)   ; new-origin
                       (make-vect 1.0 1.0)   ; new end of edge1
                       (make-vect 0.0 0.0))) ; new end of edge2
(define (flip-horiz painter)
    (transform-painter painter
                       (0.0 1.0)
                       (0.0 0.0)
                       (1.0 1.0)))
(define (beside painter1 painter2)
    (let ((split-point (make-vect 0.5 0.0)))
        (let ((paint-left (transform-painter painter1
                                             (make-vect 0.0 0.0)
                                             split-point
                                             (make-vect 0.0 1.0)))
              (paint-right (transform-painter painter2
                                             split-point
                                             (make-vect 1.0 0.0)
                                             (make-vect 0.0 1.0))))
        (lambda (frame) 
            (paint-left frame)
            (paint-right frame)))))
(define (below painter1 painter2)
    (let ((split-point (make-vect 0.0 0.5)))
        (let ((paint-below (transform-painter painter1
                                             (make-vect 0.0 0.0)
                                             (make-vect 1.0 0.0)
                                             split-point))
              (paint-above (transform-painter painter2
                                             split-point
                                             (make-vect 1.0 0.0)
                                             (make-vect 0.0 1.0))))
        (lambda (frame) 
            (paint-left frame)
            (paint-right frame)))))
