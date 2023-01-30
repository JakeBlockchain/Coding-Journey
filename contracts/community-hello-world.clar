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

;; Get community billboard
(define-read-only (get-billboard) 
    (var-get billboard)
)

;; Get next user
(define-read-only (get-next-user) 
    (var-get next-user)
)

;;;;;;;;;;;;;;;;;;;;;
;; Write Functions ;;
;;;;;;;;;;;;;;;;;;;;;

;; Update billboard
;; @desc - function users by next-user to update the community billboard
;;@param - new-user-name: (string-ascii 24)
(define-public (update-billboard (updated-user-name (string-ascii 24))) 
    (begin
    ;; Assert that tx-sender is next-user (approved by admin)

    ;; Assert that updated-user-name is not empty

    ;; Var-set billboard with new keys

    (ok true)
    )
)

;; Admin Set New User
;;@desc - functiuon used by admin to set / give permission to next user
;;@param - updated-user-principal: principal
(define-public (admin-set-new-user (updated-user-principal principal)) 
    (begin 

        ;; Assert that tx-sender is admin

        ;; Assert that Updated-user-principal is NOT admin

        ;; Assert that updated-user-principal is NOT current next-user

        ;; Var-set next-user with updated-user-principal

    (ok true)
    )
)
