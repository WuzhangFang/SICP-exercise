;; Exercise 3.46
; |   Process 1        cell       Process 2
; |                    (#f)
; |        _____________||_____________
; |        |                          |
; |  [acccess cell]                   |
; |        |                    [acccess cell]
; |        |                          |
; |        |                    [modify cell]
; |  [modify cell]       _____________|
; |        |             |
; |        |             v      [return false]
; |        |           (#t)
; |        |_____________
; |                     |
; |  [return false]     v
; |                    (#t)
; v
;time
; from https://github.com/kana/sicp/blob/master/ex-3.46.md
