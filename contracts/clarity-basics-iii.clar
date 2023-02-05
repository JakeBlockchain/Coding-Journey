
;; title: clarity-basics-iii
;; Day 20 - Introduction to Lists I
(define-read-only (list-bool) 
    (list true false true)
)
(define-read-only (list-num) 
    (list u2 u10 u10 u5 u33)
)
(define-read-only (list-string) 
    (list "Jacob" "Brown" "Host" "of" "the" "Built" "on" "Bitcoin" "Podcast")
)
(define-read-only (list-principals) 
    (list 'ST3PF13W7Z0RRM42A8VZRVFQ75SV1K26RXEP8YGKJ 'ST3NBRSFKX28FQ2ZJ1MAKX58HKHSDGNV5N7R21XCP)
)

(define-data-var num-list (list 10 uint) (list u1 u2 u3 u4))
(define-data-var principal-list (list 5 principal) (list tx-sender 'ST3PF13W7Z0RRM42A8VZRVFQ75SV1K26RXEP8YGKJ 'ST3NBRSFKX28FQ2ZJ1MAKX58HKHSDGNV5N7R21XCP))

;; Element-At (Value @ Index position)
(define-read-only (element-at-num-list (index uint))
    (element-at (var-get num-list) index)
)
(define-read-only (element-at-principal-list (index uint)) 
    (element-at (var-get principal-list) index)
)

;; Index-Of (Provide value and get Index of that value)
(define-read-only (index-of-num-list (item uint)) 
    (index-of (var-get num-list) item)
)
(define-read-only (index-of-principal-list (item principal)) 
    (index-of (var-get principal-list) item)
)