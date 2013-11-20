(in-package #:macro-environment)


(defun sym-with-postfix (sym post)
  (intern (concatenate 'string 
                       (symbol-name sym)
                       post)))


(defun function-name (name)
;; lower-case, to not conflict that easily
  (sym-with-postfix name "%f"))


(defmacro define-m-e-fn (name (env) &body body)
  (let ((fn (function-name name)))
    `(defun ,fn (,env)
      ,@ body)))
  

(defmacro define-macro+function (name (env) &body body)
  "Defines a function and a macro, and provides a default implementation.
   Implementations can override via DEFINE-M-E-FN
   (this preserves the docstring given here).

   The (only) argument of the function is the environment."
  (let (;(g (gensym))
        (mn (sym-with-postfix name "%"))
        (fn (function-name name))
        (doc (if (typep (first body)
                        'string)
               (pop body)
               nil)))
    `(progn
       ;; includes the documentation string
       (defun ,name (env)
         ,doc
         (,fn env))
       (define-m-e-fn ,name (env)
                      ,@body)
       (defmacro ,mn (&environment env)
         `(quote ,(,name env))))))



