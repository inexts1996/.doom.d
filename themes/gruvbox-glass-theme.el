
;; If you are distributing this theme, please replace this comment
;; with the appropriate license attributing the original VS Code
;; theme author.

(deftheme gruvbox-glass "A nice dark theme.")


(let (
(color0 "#161819")
(color1 "#ebdbb2")
(color2 "#2a2c2d")
(color3 "#434546")
(color4 "#2f3132")
(color5 "#313435")
(color6 "#ffefc6")
(color7 "#454849")
(color8 "#ffffda")
(color9 "#32302f")
(color10 "#616364")
(color11 "#fabd2f")
(color12 "#928374")
(color13 "#d3869b")
(color14 "#fb4934")
(color15 "#b8bb26")
(color16 "#83a598")
(color17 "#665c54")
(color18 "#252728")
(color19 "#faeac1")
(color20 "#212324")
(color21 "#f6e6bd"))


(custom-theme-set-faces
'gruvbox-glass


;; BASIC FACES
`(default ((t (:background ,color0 :foreground ,color1 ))))
`(hl-line ((t (:background ,color2 ))))
`(cursor ((t (:foreground ,color1 ))))
`(region ((t (:background ,color3 ))))
`(secondary-selection ((t (:background ,color4 ))))
`(fringe ((t (:background ,color0 ))))
`(mode-line-inactive ((t (:background ,color5 :foreground ,color6 ))))
`(mode-line ((t (:background ,color7 :foreground ,color8 ))))
`(minibuffer-prompt ((t (:background ,color9 :foreground ,color1 ))))
`(vertical-border ((t (:foreground ,color10 ))))


;; FONT LOCK FACES
`(font-lock-builtin-face ((t (:foreground ,color11 ))))
`(font-lock-comment-face ((t (:foreground ,color12 :fontStyle :italic t ))))
`(font-lock-constant-face ((t (:foreground ,color13 ))))
`(font-lock-function-name-face ((t (:foreground ,color11 ))))
`(font-lock-keyword-face ((t (:foreground ,color14 ))))
`(font-lock-string-face ((t (:foreground ,color15 ))))
`(font-lock-type-face ((t (:foreground ,color11 ))))
`(font-lock-variable-name-face ((t (:foreground ,color16 ))))


;; linum-mode
`(linum ((t (:foreground ,color17 ))))
`(linum-relative-current-face ((t (:foreground ,color17 ))))


;; display-line-number-mode
`(line-number ((t (:foreground ,color17 ))))
`(line-number-current-line ((t (:foreground ,color17 ))))


;; THIRD PARTY PACKAGE FACES


;; doom-modeline-mode
`(doom-modeline-bar ((t (:background ,color7 :foreground ,color8 ))))
`(doom-modeline-inactive-bar ((t (:background ,color5 :foreground ,color6 ))))


;; web-mode
`(web-mode-string-face ((t (:foreground ,color15 ))))
`(web-mode-html-tag-face ((t (:foreground ,color14 ))))
`(web-mode-html-tag-bracket-face ((t (:foreground ,color14 ))))
`(web-mode-html-attr-name-face ((t (:foreground ,color11 ))))


;; company-mode
`(company-tooltip ((t (:background ,color18 :foreground ,color19 ))))


;; org-mode
`(org-block ((t (:background ,color20 :foreground ,color21 ))))
`(org-block-begin-line ((t (:foreground ,color12 ))))))


(custom-theme-set-variables
  'gruvbox-glass
  '(linum-format " %3i "))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


;;;###autoload
(defun gruvbox-glass-theme()
  "Apply the gruvbox-glass-theme."
  (interactive)
  (load-theme 'gruvbox-glass t))


(provide-theme 'gruvbox-glass)


;; Local Variables:
;; no-byte-compile: t
;; End:


;; Generated using https://github.com/nice/themeforge
;; Feel free to remove the above URL and this line.
