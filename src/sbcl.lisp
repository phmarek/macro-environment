(in-package #:macro-environment)


(define-m-e-fn lexical-vars (env)
  (loop for (var . rest) in (slot-value env 'sb-c::vars)
        for v-i = (sb-cltl2:variable-information var env)
        if (eq v-i :lexical)
        collect var))

#+nil
  (let ((a 1)
        (b 2))
    (subseq
      (concatenate 'list
    (m-e::lexical-vars%)
    (list a b))))

