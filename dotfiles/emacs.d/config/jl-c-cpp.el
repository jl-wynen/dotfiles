;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Customize Emacs C and C++ modes
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; pick indentation style
(setq c-default-style '((other . "bsd")))

;; set indentation depth
(setq-default c-basic-offset 4)

;; enable flycheck
;; TODO extend by cppcheck
(add-hook 'c++-mode-hook (lambda ()
                           (flycheck-mode)
                           (flycheck-select-checker 'c/c++-gcc)))
