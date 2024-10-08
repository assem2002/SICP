(define (list-of-values exps env)
    (if (no-operands? exps)
    '()
    (begin (define left (eval (first-operand exps) env))
            (cons left (list-of-values (rest-operands exps) env)))))

(define (list-of-values exps env)
    (if (no-operands? exps)
    '()
    (begin (define right (list-of-values (rest-operands exps) env))
            (cons (eval (first-operand exps) env) right))))
