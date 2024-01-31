#lang racket

(require "../../basics.rkt")

(displayln (sum-list '(5 2 3 5 0 1 3 2))) 
(displayln (sum-list (range 0 1000))) 

;; (render-hash (interpret-commands '((assign x 0) (assign y 1) (swap x y))))
;; (render-hash (interpret-commands '((assign x 1) (assign y 2) (assign z 3) (assign a 4)
;;                                                 (swap x y) (swap y z) (swap a x)
;;                                                 (add x y z) (add y z x)
;;                                                 (add y y y) (add y z z)
;;                                                 (swap x y) (swap x z) (swap z z))))

(with-output-to-file "output"
  (lambda ()
    (displayln (sum-list '(5 2 3 5 0 1 3 2))) 
    (displayln (sum-list (range 0 1000))))
  #:exists 'replace)
