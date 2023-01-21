;; Clarity Basics 1
;; Day 3 - Booleans & Read-Only
;; Day 4 - Unsigned and signed integers

;; Day 3
(define-read-only (show-true-i) 
    true
)

(define-read-only (show-false-i) 
    false
)

(define-read-only (show-true-ii) 
    (not false)
)

(define-read-only (show-false-ii) 
    (not false)
)

;; Day 4 - Simple Operators
(define-read-only (addition)
 (+ 1 10)
)

(define-read-only (subtract-signed)
 (- 1 5)
)

(define-read-only (subtract-unsigned)
 (- u1 u5)
)

(define-read-only (multiply) 
    (* u10 u5)
)

(define-read-only (divide) 
    (/ u10 u0)
)

(define-read-only (uint-to-int)
    (to-int u4)
)

(define-read-only (int-to-uint)
    (to-uint 2)
)

;; Day 5 - Advanced Operators
(define-read-only (exponent) 
    (pow u2 u3)
)

(define-read-only (square-root) 
    (sqrti u25)
)

(define-read-only (modulo)
    (mod u4 u2)
)

(define-read-only (logTwo)
    (log2 u16)
)

;; Day 6 - Strings and Concatenation
(define-read-only (sayHello )
    "Hello"
)

(define-read-only (HelloWorld) 
    (concat "Hello World, " "Why arnt you building on Bitcoin?")
)

(define-read-only (helloWorldName) 
    (concat 
        (concat "Hello " "World, ") 
        "Jake"
    )
)

;; Day 7 - And/Or
(define-read-only (and-i)
    (and true true)
)

(define-read-only (and-ii)
    (and 
        (> u2 u1) 
        (and (> u5 u3) true)
        true
    )
)

(define-read-only (or-i)
(or true false)
)

(define-read-only (or-ii)
    (or 
        (< u2 u1)
        (not true)
        (and (> u2 u1) true )
    )
)

