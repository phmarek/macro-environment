(in-package #:macro-environment)


(defmacro defimpl (name args &body body)
  `(unless (fboundp ',name)
     (defun ,name ,args
       ,@ body)))

