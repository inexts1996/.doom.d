;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
(prefer-coding-system 'utf-8-unix)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
 (setq user-full-name "iNeXTs"
       user-mail-address "inexts0618@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Maple Mono NF CN" :size 15)
doom-variable-pitch-font (font-spec :family "Maple Mono NF CN" :size 15))
(setq doom-symbol-font (font-spec :family "Maple Mono NF CN" :size 15))
(setq doom-big-font (font-spec :family "Maple Mono NF CN" :size 20))

(defun my-cjk-font()
    (dolist (charset '(kana han cjk-misc symbol bopomofo))
      ;; (set-fontset-font t charset (font-spec :family "LXGW WenKai Screen" :size 16))))
      (set-fontset-font t charset (font-spec :family "Sarasa Term SC Nerd" :size 16))))
  (add-hook 'after-setting-font-hook #'my-cjk-font)
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is th e default:
;;(setq doom-theme 'doom-one)
;;(setq doom-theme 'sanityinc-tomorrow-bright)
;; (setq doom-theme 'mindre)
(use-package mindre-theme
    :ensure t
    :custom
    (mindre-use-more-bold nil)
    (mindre-use-faded-lisp-parens t)
    :config
    (load-theme 'mindre t))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; (setq default-frame-alist '((undecorated . t)))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;(setq org-directory "~/org/")
;; (setq org-directory "e:/2_AREAS/OrgNotes/")
(setq org-directory "e:/iCloudDrive/iCloud~com~appsonthemove~beorg/org/OrgNotes/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(mode-line-bell-mode)

;; org-modern 设置
;; (add-hook 'org-mode-hook #'org-modern-mode)
;; (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
;; (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(use-package! org-superstar
  :hook (org-mode . org-superstar-mode)
  :config
  ;; Set the custom bullet list
  (setq org-superstar-headline-bullets-list '("☰" "☷" "☯" "☭"))
  ;; Optionally, remove leading stars for a cleaner look
  (setq org-superstar-leading-bullet " ")
  ;; Uncomment if you want to align bullets
  (setq org-superstar-special-todo-items t)
)

(use-package! org-modern
  :after org
  :hook (org-mode . org-modern-mode)
  :hook (org-agenda-finalize . org-modern-agenda)
  :config
  ;; Disable org-modern's list styling if it conflicts with org-superstar
  (setq org-modern-hide-stars nil) ;; Ensure leading stars are visible
)

;; C# and LSP configuration
(after! csharp-mode
  (setq csharp-server-install-location (expand-file-name "~/.emacs.d/.local/etc/lsp/omnisharp-roslyn"))
  (setq lsp-csharp-server-path csharp-server-install-location)
  (setq lsp-csharp-server-args '("--languageserver")))

(after! lsp-mode
  (add-to-list 'lsp-language-id-configuration '(csharp-mode . "csharp"))
  (setq lsp-csharp-server-install-dir csharp-server-install-location)
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection `("dotnet" ,(expand-file-name "omnisharp/OmniSharp.exe" csharp-server-install-location) "--languageserver" "--hostPID" (number-to-string (emacs-pid))))
    :major-modes '(csharp-mode)
    :server-id 'omnisharp)))

(menu-bar-mode 1)
