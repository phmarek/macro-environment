(in-package #:macro-environment-impl)


(defun lexical-vars (env)
  (loop for (var . rest) in (slot-value env 'sb-c::vars)
        for v-i = (sb-cltl2:variable-information var env)
        if (eq v-i :lexical)
        collect var))
