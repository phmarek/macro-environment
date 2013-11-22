(ql:quickload :alexandria)
(ql:quickload :fiveam)
(defpackage :macro-environment-test
  (:use #:cl
        #:alexandria
        #:macro-environment
        #:fiveam))
(in-package :macro-environment-test)



(test one-level

  (is
    (set-equal
      '(3 a b)
      (let ((a 1)
            (b 2))
        (cons (+ a b)
              (m-e::lexical-vars)))))

  (is
    (set-equal
      '(3 (a 1) (b 2))
      (let ((a 1)
            (b 2))
        (cons (+ a b)
              (m-e::lexical-vars-alist)))
      :test #'equal))


  ;; Check evaluation order
  (is
    (set-equal 
      '((b 4) (a 6))
      (let ((a 1)
            (b 5))
        (incf a b)
        (decf b 1)
        (m-e::lexical-vars-alist))
      :test #'equal))
  
 (is
    (set-equal 
      '((a 1) (b 5) 6 4 (b 4) (a 6))
      (let ((a 1)
            (b 5))
        (concatenate 'list
                     (m-e::lexical-vars-alist)
                     (list (incf a b)
                           (decf b 1))
                     (m-e::lexical-vars-alist)))
      :test #'equal)))

(run! 'one-level)
