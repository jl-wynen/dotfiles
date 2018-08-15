;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Emacs colour theme Aiphi
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftheme aiphi)

(custom-theme-set-faces
 'aiphi
 '(default ((t (:stipple nil :background "grey15" :foreground "grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil))))
 '(cursor ((t (:background "grey"))))
 '(fringe ((t (:background "grey10"))))
 '(scroll-bar ((t (:background "Grey70" :foreground "Grey20"))))
 '(tooltip ((t (:foreground "black" :background "#ffed00"))))
 '(ac-selection-face ((t (:background "firebrick"))))

 '(escape-glyph ((t (:foreground "white"))))
 '(minibuffer-prompt ((t (:foreground "#57AB27"))))
 '(button ((t (:inherit (link)))))
 '(link ((((class color) (min-colors 88) (background dark)) (:underline (:color foreground-color :style line) :foreground "cyan3")) (t (:inherit (underline)))))
 '(link-visited ((t (:inherit (link)))))

 '(highlight ((t (:background "grey10"))))
 '(region ((t (:background "grey30"))))
 '(cua-rectangle ((t (:inherit: "region"))))
 '(visible-mark-active ((t (:background "grey65"))))
 '(visible-mark-face1 ((t (:box (:color "light steel blue")))))

 '(isearch ((t (:background "SteelBlue"))))
 '(isearch-lazy-highlight-face ((t (:inherit lazy-highlight))))
 '(lazy-highlight ((t (:background "SteelBlue4"))))

 '(match ((t (:background "yellow1"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch)))))

 '(ebib-modified-face ((t (:foreground "white" :bold t :weight bold))))

 '(header-line ((t (:box (:line-width -1 :style released-button) :background "grey" :foreground "black" :box nil))))
 '(tabbar-default ((t (:inherit header-line))))
 '(tabbar-button ((t (:background "grey" :foreground "grey"))))
 '(tabbar-button-highlight ((t (:background "white" :foreground "grey"))))
 '(tabbar-highlight ((t (:underline t :background "white" :foreground "grey10"))))
 '(tabbar-modified ((t (:background "grey80" :foreground "firebrick2"))))
 '(tabbar-selected ((t (:background "grey10" :foreground "grey80"))))
 '(tabbar-selected-modified ((t (:background "grey10" :foreground "SteelBlue1"))))
 '(tabbar-separator ((t (:background "black" :foreground "grey"))))
 '(tabbar-unselected ((t (:background "grey" :foreground "grey10"))))

 '(ido-subdir ((t (:foreground "#2889e0" :weight bold))))
 '(ido-first-match ((t (:foreground "white" :weight bold))))
 '(ido-only-match ((t (:foreground "white" :weight bold))))

 '(info-menu-star ((t (:bold t :foreground "white"))))
 '(info-header-xref ((t (:bold t :underline t :weight bold :foreground "black"))))
 '(info-xref ((t (:bold t :foreground "sky blue" :weight bold))))
 '(info-xref-visited ((t (:inherit info-xref))))

 '(show-paren-match ((t (:background "LightSteelBlue4" :foreground "white"))))
 '(show-paren-mismatch ((t (:background "#cc071e" :foreground "white"))))

 '(trailing-whitespace ((t (:box t))))
 '(whitespace-trailing ((t (:foreground "Grey40" :strike-through t))))

 '(font-latex-bold-face ((t (:inherit bold))))
 '(font-latex-italic-face ((t (:inherit italic))))
 '(font-latex-script-char-face ((t (:foreground "burlywood"))))
 '(font-latex-sectioning-5-face ((t (:inherit variable-pitch :weight bold :bold t :foreground "#ffed00"))))
 '(font-latex-sectioning-4-face ((t (:inherit font-latex-sectioning-5-face :height 1.1))))
 '(font-latex-sectioning-3-face ((t (:inherit font-latex-sectioning-4-face :height 1.1))))
 '(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-3-face :height 1.1))))
 '(font-latex-sectioning-1-face ((t (:inherit font-latex-sectioning-2-face :height 1.1))))
 '(font-latex-sectioning-0-face ((t (:inherit font-latex-sectioning-1-face :height 1.1))))
 '(font-latex-warning-face ((t (:foreground "#cc071e"))))

 '(font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:italic t :foreground "grey55" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "brown"))))
 '(font-lock-doc-face ((t (:foreground "cadet blue"))))
 '(font-lock-doc-string-face ((t (:foreground "medium aquamarine"))))
 '(font-lock-function-name-face ((t (:bold 0 :foreground "#ce3159" :weight normal))))
 '(font-lock-keyword-face ((t (:bold t :foreground "#7a6fac" :weight bold))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-pattern-face ((t (:foreground "CadetBlue" :weight normal))))
 '(font-lock-preprocessor-face ((t (:inherit font-lock-keyword-face))))
 '(font-lock-regexp-grouping-backslash ((t nil)))
 '(font-lock-regexp-grouping-construct ((t nil)))
 '(font-lock-string-face ((t (:foreground "firebrick2"))))
 '(font-lock-type-face ((t (:bold 0 :foreground "PaleGreen3" :weight normal))))
 '(font-lock-variable-name-face ((t (:inherit default))))
 '(font-lock-warning-face ((t (:bold t :foreground "dark orange" :weight bold))))
 '(font-lock-wildcard-face ((t (:foreground "CadetBlue" :weight normal))))

 '(speedbar-button-face ((t (:foreground "seashell2"))))
 '(speedbar-directory-face ((t (:bold t :foreground "#2889e0"))))
 '(speedbar-file-face ((t (:foreground "grey"))))
 '(speedbar-highlight-face ((t (:background "dark slate blue" :foreground "wheat"))))
 '(speedbar-selected-face ((t (:foreground "seashell1" :underline t))))
 '(speedbar-separator-face ((t (:background "blue" :foreground "white" :overline "gray"))))
 '(speedbar-tag-face ((t (:foreground "antique white"))))
 )

(provide-theme 'aiphi)
