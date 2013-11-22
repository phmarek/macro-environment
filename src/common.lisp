(in-package :macro-environment)

(defmacro lexical-vars (&environment env)
  "Gives a list of symbols for the lexically defined variables.

   For composing in other macros you might want to use
   M-E-IMPL:LEXICAL-VARS."
  `',(m-e-impl:lexical-vars env))


(defun lexical-vars-alist% (env)
  "Gives an alist of lexicals and their values.
   This only makes sense during runtime.

   Does work eg. for PRINTing."
  (loop for var in (m-e-impl:lexical-vars env)
        collect `(list ',var ,var) into result
        finally (return `(list ,@ result))))


(defmacro lexical-vars-alist (&environment env)
  "Returns the list of lexicals including their values, with
   LIST at the start.
   This only makes sense during runtime.

   Macros will have to quote the value somehow, or prepend LIST."
  (lexical-vars-alist% env))
