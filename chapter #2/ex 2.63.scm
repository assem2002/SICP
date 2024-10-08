

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
(list entry left right))

(define (tree->list-1 tree)
(if (null? tree)
    '()
(append (tree->list-1 (left-branch tree))
(cons (entry tree)
(tree->list-1
(right-branch tree))))))



(define (tree->list-2 tree)
(define (copy-to-list tree result-list)
(if (null? tree)
result-list
(copy-to-list (left-branch tree)
(cons (entry tree)
(copy-to-list
(right-branch tree)
result-list)))))
(copy-to-list tree '()))

(tree->list-1 '(7 (3 ( 1 nil nil) (5 nil nil)) (9 nil (11 nil nil)) ) )
(tree->list-2 '(7 (3 ( 1 nil nil) (5 nil nil)) (9 nil (11 nil nil)) ) )

(tree->list-1 '(3 (1 nil nil) (7 (5 nil nil) (9 nil (11 nil nil))) ) )
(tree->list-2 '(3 (1 nil nil) (7 (5 nil nil) (9 nil (11 nil nil))) ) )

; they both provide the inorder traversal representation of the tree
; they work differently (reverse approach) but the assembling of the parts leads to the same results in both.

