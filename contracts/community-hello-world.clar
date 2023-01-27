;; community-hello-world
;; Contract that provides a community billboad, readable by anyone but only updateable by admin

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Constants, Variables & Maps ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Constant that sets admin to the contract deployer
(define-constant admin tx-sender)

;; Variable that keeps track of the next user that has "write" access to the billboard
(define-data-var next-user principal tx-sender)

;;Variable tuple that contains new member info
(define-data-var billboard {new-user-principal: principal, new-user-name: (string-ascii 24)} {
    new-user-principal: tx-sender,
    new-user-name: ""
})

;;;;;;;;;;;;;;;;;;;;
;; Read Functions ;;
;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;
;; Write Functions ;;
;;;;;;;;;;;;;;;;;;;;;