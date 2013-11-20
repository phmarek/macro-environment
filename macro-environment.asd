(asdf:defsystem #:macro-environment
  :serial t
  :description "A set of functions to get information about environments, mostly for macro programming."
  :author "Philipp Marek <philipp@marek.priv.at"
  :license "LLGPL 2.1"
  :version "0.0.1"
  :components ((:module "src" 
                :serial T
                :components ((:file "package")
                             (:file "macro")
                             (:file "declarations")
                             #+sbcl (:file "sbcl")
                             ))))

