;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Customize Emacs LaTeX mode
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq TeX-save-query nil)
(setq-default Tex-master nil)
(setq TeX-PDF-mode t)

(setq ispell-program-name "aspell")
(setq ispell-dictionary "english")

(add-hook 'LaTeX-mode-hook (lambda ()
                             (visual-line-mode)
                             (flycheck-mode)
                             (LaTeX-math-mode)
                             (turn-on-reftex)
                             ))

(setq reftex-plug-into-AUCTeX t)

;; British style quotes
(setq TeX-open-quote "`")
(setq TeX-close-quote "'")

(add-hook 'reftex-mode-hook (lambda ()
                              (modify-syntax-entry ?^ "." reftex-syntax-table)
                              (modify-syntax-entry ?_ "." reftex-syntax-table)

                              (prettify-symbols-mode)

                              (flyspell-mode 1)
                              (flyspell-buffer)

                              ;; dont work
                              ;; (define-key reftex-mode-map (kdb "` <right>") (lambda () (interactive) (insert "\\rightarrow")))
                              ;; (define-key reftex-mode-map (kdb "` <left>") (lambda () (interactive) (insert "\\leftarrow")))

                              ;; switch # and \ (useful for German keyboards)
                              ;; (define-key reftex-mode-map (kbd "#") (lambda () (interactive) (insert "\\")))
                              ;; (define-key reftex-mode-map (kbd "\\") (lambda () (interactive) (insert "#")))
                              ))
