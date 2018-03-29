
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/bjorn")

(require 'my-packages)
(require 'my-settings)
(require 'my-elisp)
(require 'my-bindings)
(require 'my-hooks)
(require 'my-ruby)

(load custom-file 'noerror)

(server-start)
