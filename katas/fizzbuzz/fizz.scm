(define make-list
  (lambda (n)
    (if (equal? n 0)
      '()
      (append (make-list (- n 1)) (list n))
    )
  )
)

(define fizzbuzz
  (lambda (n)
    (map getfb (make-list n))))

(define getfb
  (lambda (i)
    (cond
      ((and (has-digit i 3) (has-digit i 5)) "fizzbuzz" )
      ((has-digit i 3) "fizz" )
      ((has-digit i 5) "buzz" )
      ((eq? (modulo i 15) 0) "fizzbuzz")
      ((eq? (modulo i 3) 0) "fizz")
      ((eq? (modulo i 5) 0) "buzz")
      (else i)
    )
  )
)

(define elem
  (lambda (item items)
    (if (null? items)
      #f
      (if (eqv? (* 1.0 item) (* 1.0 (car items)))
        #t
        (elem item (cdr items))))))

(define digits
  (lambda (n)
    (if (< n 10)
      (list n)
      (cons (modulo n 10) (digits (floor (/ n 10)))))))

(define has-digit
  (lambda (n digit)
    (elem digit (digits n))))

(map print (fizzbuzz 42))
