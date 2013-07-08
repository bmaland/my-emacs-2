(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; make sure el-get is installed
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))

(setq el-get-sources
      '(
        (:name liquid-mode
               :type git
               :url "git://github.com/rehanift/Emacs-Liquid.git"
               :post-init (progn
                            (autoload 'liquid-mode "liquid" nil t)))
        (:name how-do-i
               :type git
               :url "git://github.com/edmellum/how-do-i.el.git")
        (:name pretty-symbols
               :type git
               :url "git://github.com/drothlis/pretty-symbols.git")
        ))

(setq my-packages
  '(
    anything
    expand-region
    golden-ratio
    liquid-mode
    org-mode
    rspec-mode
    rvm
    smex
    textmate
    tomorrow-theme
    yasnippet
    how-do-i
    pretty-symbols
    rhtml-mode
    ))

(el-get 'sync my-packages)
(provide' my-packages)
