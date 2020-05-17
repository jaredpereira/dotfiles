;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Jared Pereira"
      user-mail-address "jared@awarm.space")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-solarized-light)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'markdown-mode-hook 'auto-fill-mode)

;; Flycheck
(after! flycheck
 (setq
  flycheck-check-syntax-automatically '(mode-enabled save idle-change)
  flycheck-indication-mode 'left-fringe))
(after! org (setq org-capture-templates '(("j" "journal" plain
                                           (file+olp+datetree "~/org/journal.org" )
                                           "%U
%?

*One task*:
*Newsletter*:
" :tree-type week)
                                          ("i" "inbox" entry
                                           (file+olp "~/homepage/inbox.org" "Inbox")
                                           "* %?
%U"
                                           )
                                          )))

;; Deft

(after! deft (setq deft-directory "~/notes"))

;; Custom shortcuts

(global-set-key (kbd "C-l") (lambda () (interactive) (org-capture nil)))
(global-set-key (kbd "C-f") (lambda () (interactive) (+ivy/projectile-find-file)))
(global-set-key (kbd "C-c l") 'insert-file-name-from-project)

;; authinfo

(setq auth-sources '("~/.authinfo"))

;; Neotree
(after! neotree (setq neo-smart-open t))

;; Company
(after! company (setq company-idle-delay 0.2
                      company-minimum-prefix-length 2))
;; Indentation
(defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  (setq typescript-indent-level n)
  )
(my-setup-indent 2)

(after! magit (setq forge-topic-list-limit '(20 . 0)))

(setq doom-modeline-enable-word-count t)

(keychain-refresh-environment)

(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))

(defun insert-file-name-from-project (filename)
  (interactive "P")
  (let* ((project-root (projectile-ensure-project (projectile-project-root)))
         (file (projectile-completing-read "Find file: "
                                           (projectile-project-files project-root))))
    (funcall #'insert (file-relative-name (expand-file-name file project-root)))
    ))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
