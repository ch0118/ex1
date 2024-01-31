;; CIS352 Exercise 1 -- Racket Basics
;;
;; Collaboration IS allowed (max group size of three).
;; 
;; Student 1: _________________________
;; Student 2: _________________________
;; Student 3: _________________________
;; 
;; In this exercise, you will do four problems. There is
;; some optional prose which you can think of as
;; lecture notes. For the purposes of getting points
;; on the project, it is irrelevant. But please read
;; it in preparation for the class and to study
;; for the exam.
#lang racket

(provide
 f
 third
 sum-list
 max-list)

;; PROBLEM 1
;; 
;; Translate the following mathematical function to a
;; Racket function:
;;     f(x,y) = x*y + y^2 + x
;; assume x,y satisfy (return #t for) number?
(define (f x y)
  'todo)

;; Racket lists
;; 
;; Racket linked lists are built out of pairs (cons cells).
;; For example, the linked list '(1 2 3) would look like:
;;
;; +----+----+     +----+----+      +----+----+
;; |  1 |  ⋅-----> |  2 |  ⋅----->  |  3 |  ⋅-----> '() 
;; +----+----+     +----+----+      +----+----+  i.e., NULL
;;
;; Each of these cells takes up some amount of space in RAM
;; (e.g., two 64-bit values may take up 16 bytes), often
;; allocated on the heap (using automatic memory management,
;; garbage collection). 
;;
;; The function first accepts a list as its argument and
;; returns the first element. I.e.,
;;
;;         +----+----+     +----+----+      +----+----+
;; (first  |  1 |  ⋅-----> |  2 |  ⋅----->  |  3 |  ⋅-----> '())
;;         +----+----+     +----+----+      +----+----+
;; = (first '(1 2 3))
;; = 1
;;
;; There is also *rest*, which returns its argument's suffix.
;; For example:
;;        +----+----+     +----+----+      +----+----+
;; (rest  |  1 |  ⋅-----> |  2 |  ⋅----->  |  3 |  ⋅-----> '())
;;        +----+----+     +----+----+      +----+----+  
;; =      +----+----+      +----+----+
;;        |  2 |  ⋅----->  |  3 |  ⋅-----> '())
;;        +----+----+      +----+----+
;; = '(2 3)
;;

;; Building lists with cons
;;
;; You can build linked lists by using (cons e l) to prepend
;; a list element e to the list l. There is no requirement that
;; the elements of l have the same type (indeed, there is no
;; explicit notion of typing). But often, we will use lists
;; whose elements are all of the same type.
;;
;;  - The first argument to cons is an *element*
;;  - The second argument to cons is a *list*
;;
;; Examples:
;; - The list '(1) is written as (cons 1 '())
;; - The list '(1 2) is written as (cons 1 (cons 2 '()))
;; - The list '(1 2 3) is writen as (cons 1 (cons 2 (cons 3 '())))
;;

;; OPTIONAL BLOCK
;; Under the hood (more complex material, read if you want):
;; - The language runtime is using dynamic memory allocation
;;   (a variant of malloc) to allocate cons cells on-the-fly
;;   as you call cons.
;; - Racket translates literals such as '(1 2 3) into their
;;   fully-explicit representation during compliation.
;; - Also, notice that the box diagram above is slightly wrong.
;;   Because Racket integers are not fixed-width in general,
;;   the list often will not contain `1` directly, but instead
;;   a *pointer* to a heap-allocated representation of `1`.
;;   At least, the language must be able to differentiate
;;   pointers from raw integers. There are different approaches
;;   to handling this. For example, OCaml tags pointers with
;;   a single bit, then dictating that the size of integer
;;   values shrinks to 2^^63
;; END OPTIONAL

;; IMPORTANT functions using lists (know at least these):
;; (list e0 e1 ...) -- As many arguments (including 0) as you want,
;; builds a list out of its argumeents
;; (cons e l) -- Prepend the element e to the list l
;; (first l) -- Return the first element of the list
;; (rest l) -- Return the rest of the list l (a list)
;; (car l)/(cdr l) -- same as first/rest
;; (empty? l) -- Is the list empty? (return a boolean?)

;; Examples of these
;; (empty? (rest (rest '(1 2 3)))) ;; #f
;; (empty? (rest (rest (rest '(1 2 3))))) ;; #t

;; PROBLEM 2
;;
;; Write (third l), a function which uses first and
;; rest to get the third element of the list l. Assume
;; that l has at least three elements.
;;
;; Question (not graded): how might you handle it if the
;; list had fewer than three elements? 
(define (third l)
  'todo)

;; TOPIC: RECURSION OVER LISTS

;; Using recursion, empty?, and first/rest, we can
;; write a very important class of functions: the
;; primitive recursive functions. We will (hopefully)
;; talk about these in class.

;; See how the function here finds the length of a list
(define (length l)
  (if (empty? l)
      ;; then base case
      0
      ;; else recursive case
      (+ 1 (length (rest l)))))

;; PROBLEM 3
;; 
;; Define the sum of all elements in the list l.
;; Assume all members of l are numbers.
;; Use recursion: check if the list is empty?,
;; if so return something (what?), otherwise,
;; invoke (sum-list (rest l)) and combine the
;; result with (first l) by adding them.
;;
;; Try to remember that you should be expression-focused.
;; You can do all of this with expressions. You do not
;; need to define intermediate variables, and you
;; specifically cannot use set! to "loop" over l.
;; Instead, you must use recursion.
(define (sum-list l)
  'todo)

;; PROBLEM 4
;; 
;; Find the maximum element in a list. If the
;; list has no elements, you should return -inf.0.
;; This should also be a simple (primitive) recursive
;; function.
(define (max-list l)
  'todo)

;; OPTIONAL READING -- Primitive recursive functions
;; 
;; If you'd like to know more, early in the 20th
;; century, mathematicians and logicians were looking to
;; understand basic recursion theory (i.e., a recursive
;; approach to problem solving). Functions that are primitive
;; recursive are function over lists are functions which
;; recursively call themselves using the tail of the list.
;;
;; The above function (`length`) is primitive recursive: the
;; recursive call happens on (rest l) rather than, say,
;; (cons 1 (rest l)). If we were to rewrite the function...
;; (define (lengtha l)
;;   (if (empty? l)
;;       ;; then base case
;;       0
;;       ;; else recursive case
;;       (+ 1 (lengtha (cons 1 (rest l))))))
;; then indeed, it will not terminate for any nontrivial
;; input. This function is defined using "generative" recursion,
;; a more general kind of recursion which allows recursion
;; on arguments which are not obviously-strictly-smaller.
;; 
;; In mathematical terms, the primitive recursive functions
;; correspond to "simple" structural inductions. It is not
;; always possible to use simple structural induction to prove
;; every theorem: sometimes complete induction must be used, or
;; even a strengthened induction hypothesis. In the same way,
;; it is not always possible to write every function as a
;; primitive recursive function. However, primitive recursive
;; functions are *extremely* common, and likely comprise 90%+
;; of your every day programming; so it is worth having a
;; deep intuition for what a primitive recursive function is.
;;
;; Review of optional prose: a primitive recursive function
;; over lists always:
;;  - accepts an argument lst
;;  - invokes itself on (rest lst)
;;  - combines the result of the recursive call with (first lst)
;; 
;; This class of functions, called the primitive recursive
;; functions, necessarily terminate and do not loop--they
;; also provide generally-simpler reasoning. It is best to
;; strive for primitive recursive functions when possible.
;;
;; These primitive recursive functions have some very desirable
;; properties, such as guaranteed termination (no infinite
;; loops) and simple inductive reasoning. However, as it turns out,
;; primitive recursive functions are not always enough; there
;; are "interesting" recursive functions which are not 
;;
;; As an example of an interesting function which is not
;; primitive recursive, consider quicksort--it invokes itself
;; on a rebuilt sequence--not an obvious substructure of the
;; original inputs.
