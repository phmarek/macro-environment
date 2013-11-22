(defpackage #:macro-environment
  (:use #:cl)
  (:nicknames #:m-e)
  (:export
    #:lexical-vars
    #:lexical-vars-alist
    ))


(defpackage #:macro-environment-impl
  (:use #:cl)
  (:documentation
    "The package for bare-bones implementation details.
     Typically these only return a list, which gets processed by functions
     in the :MACRO-ENVIRONMENT package.")
  (:export
    #:lexical-vars
    )
  (:nicknames #:m-e-impl))


;; We don't want to export that macro,
;; but using the package every time is bothersome, too.
(defmacro macro-environment-impl::defimpl (&rest args)
  `(m-e::defimpl ,args))
