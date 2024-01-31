#lang racket

(require "../../basics.rkt")

(displayln (f 3 4)) 
(displayln (f 5 7))

;; (render-hash (interpret-commands '((assign x 0) (assign y 1) (swap x y))))
;; (render-hash (interpret-commands '((assign x 1) (assign y 2) (assign z 3) (assign a 4)
;;                                                 (swap x y) (swap y z) (swap a x)
;;                                                 (add x y z) (add y z x)
;;                                                 (add y y y) (add y z z)
;;                                                 (swap x y) (swap x z) (swap z z))))

(with-output-to-file "output"
  (lambda ()
    (displayln (f 3 4)) 
    (displayln (f 5 7)))
  #:exists 'replace)
