(add-to-list 'load-path "~/.emacs.d/vendor/el-get")

(require 'el-get)

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
        (:name magit
               :website "https://github.com/magit/magit#readme"
               :description "It's Magit! An Emacs mode for Git."
               :type github
               :pkgname "magit/magit"
               :branch "1.1.2"
               :info "."
               :autoloads ("50magit")
               :build (("make" "all"))
               :build/darwin `(,(concat "make EMACS=" el-get-emacs " all")))
        ))

(setq my-packages
  '(
    anything
    expand-region
    golden-ratio
    smex
    textmate
    tomorrow-theme
    ;; yasnippet
    ;; pretty-symbols
    magit
    ;; git-timemachine
    ))

(el-get 'sync my-packages)
(provide' my-packages)
