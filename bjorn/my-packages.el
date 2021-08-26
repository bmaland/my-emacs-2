(add-to-list 'load-path "~/.emacs.d/vendor/el-get")

(if (not (file-exists-p (concat (getenv "HOME") "/.emacs.d/el-get")))
    (make-directory (concat (getenv "HOME") "/.emacs.d/el-get")))

(require 'el-get)

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(setq my-packages
      '(
        anything
        expand-region
        golden-ratio
        smex
        textmate
        tomorrow-theme
        yasnippet
        magit
        ))

(el-get 'sync my-packages)
(provide' my-packages)
