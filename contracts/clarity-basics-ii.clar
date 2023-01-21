;; Clarity Basics ii

;; Day 8 - Optionals and Parameters
(define-read-only (show-some-i) 
    (some u2)
)

(define-read-only (show-none-i) 
    none
)
(define-read-only (params (num uint) (string (string-ascii 48)) (boolean bool)) 
    num
)
(define-read-only (params-optional (num (optional uint)) (string (optional (string-ascii 48))) (boolean (optional bool))) 
    num
)

;; Day 9 - Optionals Pt. II
(define-read-only (is-some-example (num (optional uint))) 
    (is-some num)
)
(define-read-only (is-none-example (num (optional uint))) 
    (is-none num)
)
(define-read-only (params-optional-and (num (optional uint)) (string (optional (string-ascii 48))) (boolean (optional bool))) 
    (and 
        (is-some num)
        (is-some string)
        (is-some boolean)
    )
)

;; Day 10 - Intro to Constants & Variables
(define-constant fav-num u25)
(define-constant greeting "Hello, ")
(define-data-var my-age uint u33)
(define-data-var your-name (string-ascii 24) "Jacob Brown")

(define-read-only (show-constant)
    greeting
)
(define-read-only (show-constant-double)
    (* fav-num u2)
)
(define-read-only (show-constant-double1)
    (concat greeting ", Win the day!")
)
(define-read-only (show-age) 
    (var-get my-age)
)
(define-read-only (triple-current-age)
    (* u3 (var-get my-age))
)
(define-read-only (say-hi) 
    (concat greeting (var-get your-name))
)

;; Day 11 - Public Functions & Responses
;; Define-Public functions MUST return an OK or ERR response
(define-read-only (response-example) 
    (ok u10)
)
(define-public (change-name (new-name (string-ascii 24)))
    (ok (var-set your-name new-name))
)
(define-public (change-age (new-age uint))
    (ok (var-set my-age new-age))
)
;; Example contract call looks like
;; (contract-call? .clarity-basics-ii change-age u10)

;; Day 12  - Tuples & Merging
;; Tuples are immutable and can not be changed dynamically once they are set
;; To change a tuple value, you must replace it with a seperate new tuple
(define-read-only (read-tuple)
    {
        user-principal: 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM,
        user-name: "Jacob Brown",
        user-balance: u100
    }
)
(define-public (write-tuple-i (new-user-principal principal) (new-user-name (string-ascii 24)) (new-user-balance uint)) 
    (ok {
        user-principal: new-user-principal,
        user-name: new-user-name,
        user-balance: new-user-balance
    })
)
