;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Customize Emacs mode line
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;-------------------------------------
;;;    Smart-Mode-Line
;;;-------------------------------------

(require 'smart-mode-line)

;; without this, the deamon won't start
(setq sml/no-confirm-load-theme t)

(sml/setup)

(setq sml/shorten-directory t)
(setq sml/shorten-modes t)
(setq sml/position-percentage-format nil)

;; TODO use sml/hidden-modes or rich-minority-mode
;; TODO show overwrite mode with pretty font
(defvar mode-line-cleaner-alist
  `((abbrev-mode . "")
    (auto-complete-mode . "")
    (fic-mode . "")
    (emacs-lisp-mode . "λ")
    (lisp-interaction-mode . "λi")
    (jl/keys-minor-mode . "")
    (overwrite-mode . "")
    (whitespace-mode . "")
    (global-whitespace-mode . "")
    )
  "List of replacements of mode names")

(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                  (mode-str (cdr cleaner))
                  (old-mode-str (cdr (assq mode minor-mode-alist)))
                  )
             (when old-mode-str
               (setcar old-mode-str mode-str))
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;;;-------------------------------------
;;; dynamically change colour
;;;-------------------------------------

(defun jl/set-mode-line-default ()
  (set-face-attribute 'mode-line-adaptive
                      (selected-frame)
                      :inherit 'mode-line-adaptive-default))

(defun jl/set-mode-line-overwrite ()
  (set-face-attribute 'mode-line-adaptive
                      (selected-frame)
                      :inherit 'mode-line-adaptive-overwrite))

(defun jl/set-mode-line-minibuf ()
  (set-face-attribute 'mode-line-adaptive
                      (selected-frame)
                      :inherit 'mode-line-adaptive-minibuffer-active))

;; set colour when (de-)activating overwrite-mode
(add-hook 'overwrite-mode-hook
          (lambda ()
            (unless (active-minibuffer-window)
              (if (bound-and-true-p overwrite-mode)
                  (progn
                    (setq cursor-type 'box)
                    (jl/set-mode-line-overwrite))
                ;; else
                (progn
                  (setq cursor-type 'bar)
                  (jl/set-mode-line-default))
                ))))

;; set colour when entering and exiting minibuffer
(add-hook 'minibuffer-setup-hook 'jl/set-mode-line-minibuf)
(add-hook 'minibuffer-exit-hook
          (lambda ()
            (select-window (minibuffer-selected-window))
            (if (bound-and-true-p overwrite-mode)
                (jl/set-mode-line-overwrite)
              (jl/set-mode-line-default))
            (select-window (minibuffer-window))))
