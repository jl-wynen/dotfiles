;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Configuration of Emacs builtins
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; want more screen space
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;;; set frame title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (concat (abbreviate-file-name (buffer-file-name)) "%+")
                 "%b%+")))
      )

(setq inhibit-startup-screen t)  ; go straight to scratch
(setq inhibit-splash-screen t)
(setq initial-scratch-message ";;;;;;;; SCRATCH ;;;;;;;;\n\n")

(setq-default cursor-type 'bar)  ; bar cursor instead of block
(blink-cursor-mode 0)  ; don't blink
(setq-default cursor-in-non-selected-windows 'hollow)

(global-hl-line-mode)  ; highlight current line
(global-linum-mode t)  ; use line numbers

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))  ; one line at a time
(setq mouse-wheel-progressive-speed nil)  ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)  ; scroll window under mouse
(setq scroll-step 1)  ; keyboard scroll one line at a time

(setq-default scroll-bar-width 10)
;; apply it to initial frames
(modify-all-frames-parameters '((scroll-bar-width . 10)))

(global-auto-revert-mode t)  ; auto refresh buffers when changed outside
(setq global-auto-revert-non-file-buffers t)  ; and do this for dired
(setq auto-revert-verbose nil)  ; without saying anything

(setq make-backup-files nil)  ; don't create backup
(setq auto-save-default nil)  ;   and autosave files

(set-default 'truncate-lines t)  ; don't wrap long lines
(setq echo-keystrokes 0.1)  ; immediately show keystrokes
(delete-selection-mode t)  ; remove text in region if inserting text
(setq ring-bell-function 'ignore)
(set-default 'sentence-end-double-space nil)
(electric-pair-mode t)  ; autoclose braces
(defalias 'yes-or-no-p 'y-or-n-p)  ; questions can be answered with y or n

;; allow clipboard from outside emacs
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      mouse-yank-at-point t)

;; ignore some files according to their extension
(setq completion-ignored-extensions
      (append completion-ignored-extensions (list ".mod")))

;; custom theme
(load-theme 'aiphi)

;;;-------------------------------------
;;;             Cua-mode
;;;-------------------------------------
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)  ; don't tabify after rectangle commands
(setq cua-keep-region-after-copy t)


;;;-------------------------------------
;;;           IDO-Mode
;;;-------------------------------------
(setq ido-enable-flex-matching t)
(setq ido-ignore-extensions t)
(setq ido-everywhere t)
(ido-mode t)

;;;-------------------------------------
;;;           BibTeX-Mode
;;;-------------------------------------
;; setup the function for automatic key generation
(setq bibtex-autokey-year-length 4)
(setq bibtex-autokey-name-change-strings '(("'t Hooft" . "thooft")))
(setq bibtex-autokey-titlewords 2)
(setq bibtex-autokey-titleword-length 1)
(setq bibtex-autokey-titlewords-stretch 0)
(setq bibtex-autokey-titleword-separator "")
(setq bibtex-autokey-name-year-separator ":")
(setq bibtex-autokey-year-title-separator "")

;;;-------------------------------------
;;;         Whitespace-Mode
;;;-------------------------------------
(setq whitespace-style '(face trailing tab-mark))
(setq whitespace-action (list 'auto-cleanup))
(global-whitespace-mode t)
