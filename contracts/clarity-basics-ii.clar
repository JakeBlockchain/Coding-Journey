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

;; Day 12 - Tuples & Merging
(define-read-only (read-tuple)
    {
        user-principal: 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM,
        user-name: "JakeBlockchain",
        user-balance: u10
    }
 )
 (define-public (write-tuple-i (new-user-principal principal) (new-user-name (string-ascii 24)) (new-user-balance uint)) 
    (ok {
        user-principal: new-user-principal,
        user-name: new-user-name,
        user-balance: new-user-balance        
    })
 )
 (define-data-var original {user-principal: principal, user-name: (string-ascii 24), user-balance: uint}
    {
        user-principal: 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM,
        user-name: "JakeBlockchain",
        user-balance: u10
    }
)
(define-read-only (read-original) 
    (var-get original)
)
(define-public (merge-principal (new-user-principal principal)) 
    (ok (merge 
        (var-get original)
        {user-principal: new-user-principal}
    ))
)
(define-public (merge-user-name (new-user-name (string-ascii 24))) 
    (ok (merge 
        (var-get original)
        {user-name: new-user-name}
    ))
)
(define-public (merge-all (new-user-principal principal) (new-user-name (string-ascii 24)) (new-user-balance uint)) 
    (ok (merge 
        (var-get original)
    {
        user-principal: new-user-principal,
        user-name: new-user-name,
        user-balance: new-user-balance        
    })
))
;; Day 13 - Tx-Sender & Iq-Eq
(define-read-only (show-tx-sender) 
    tx-sender
)
(define-constant admin 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-read-only (check-admin) 
    (is-eq admin tx-sender)
)

;; Day 14 - Conditionals 1 (asserts)
;; Asserts are conditionals that when the assert function fails. It reverts the entire transaction.
;;Best Practice - define-constants are put at thee top of a contract
(define-read-only (show-asserts (num uint))
    (ok (asserts! (> num u2) (err u1)))
)
(define-constant err-too-large (err u1))
(define-constant err-too-small (err u2))
(define-constant err-not-auth (err u3))
(define-constant admin-one tx-sender)
;; Read only function that checks the transcction sender is the contract admin.
(define-read-only (assert-admin) 
    (ok (asserts! (is-eq tx-sender admin-one) err-not-auth))
)

;; Day 15  - Begin
;; Set & Say Hello
;; Counter increment by even numbers

(define-data-var hello-name (string-ascii 48) "Timothy")
;; @desc - This function allows a user to provide a name, which, if different, changes a name variable and returns new name
;; @param - new-name (string-ascii 48) that represents the new name
(define-public (set-and-say-hello (new-name (string-ascii 48)))
    (begin 
        ;; Assert that name is not empty
        (asserts! (not (is-eq "" new-name)) (err u1))

        ;; Assert that name is not equal to current name
        (asserts! (not (is-eq (var-get hello-name) new-name)) (err u2))

        ;; Var-set new name
        (var-set hello-name new-name)

        ;; Say hello with new name
        (ok (concat "Hello " (var-get hello-name)))
    ))
    (define-read-only (get-hello-name) 
        (var-get hello-name)
    )

    (define-data-var counter uint u0)
    (define-read-only (read-counter) 
        (var-get counter)
    )

;; @desc - This functon allows a user to increase the counter by only an even amount
;; @param - add-num: uint the user submits to add to the counter
(define-public (increment-counter-event (add-num uint)) 
    (begin 

        ;; Assert the add num is even
        (asserts! (is-eq u0 (mod add-num u2)) (err "Not an even number"))
        ;; Increment and var-set counter
        (ok (var-set counter (+ (var-get counter) add-num)))
     )
)