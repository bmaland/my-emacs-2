(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/bjorn")

(require 'my-packages)
(require 'my-settings)
(require 'my-elisp)
(require 'my-bindings)
(require 'my-hooks)
(require 'my-ruby)

(load custom-file 'noerror)

(server-start)
