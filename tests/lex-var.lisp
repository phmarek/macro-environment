(defpackage :macro-environment-test
  (:use #:cl
        #:macro-environment))
(in-package :macro-environment-test)


(equal ()
       (set-exclusive-or
         '(3 a b)
         (let ((a 1)
               (b 2))
           (cons (+ a b)
                 (m-e::lexical-vars%)))))
