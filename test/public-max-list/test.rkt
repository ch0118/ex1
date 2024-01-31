#lang racket

(require "../../basics.rkt")

(displayln (max-list '(-5 10 5 15 0 15 12 35 12))) 
(displayln (max-list (append (range 0 1000) (map - (range 0 1000))))) 

;; (render-hash (interpret-commands '((assign x 0) (assign y 1) (swap x y))))
;; (render-hash (interpret-commands '((assign x 1) (assign y 2) (assign z 3) (assign a 4)
;;                                                 (swap x y) (swap y z) (swap a x)
;;                                                 (add x y z) (add y z x)
;;                                                 (add y y y) (add y z z)
;;                                                 (swap x y) (swap x z) (swap z z))))

(with-output-to-file "output"
  (lambda ()
    (displayln (max-list '(-5.0 10.0 5.0 15.0 0.0 15.0 12.0 35.0 12.0))) 
    (displayln (max-list (append (map (lambda (x) (+ x 0.0)) (range 0 1000)) 
                                  (map (lambda (x) (+ x 0.0)) (map - (range 0 1000)))))))
  #:exists 'replace)
